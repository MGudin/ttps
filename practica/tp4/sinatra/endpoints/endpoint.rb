require 'sinatra/base'

require_relative 'middlewares'

class Endpoint < Sinatra::Base

  use Middlewares::ReplaceNumbers
  use Middlewares::XCharacterCount
  
  helpers do
    def intize *args
      args.map {|arg| arg.to_i}
    end

    def splatUnpacker aString
      aString.gsub('/', '').chars
    end

    def mcm anInt, anotherInt
      a,b = intize anInt, anotherInt
      @mcm=a.lcm(b)
    end

    def mcd anInt, anotherInt
      a,b = intize anInt, anotherInt
      @mcd = a.gcd(b)
    end

    def sum string
      numbers = intize *(splatUnpacker string)
      @sum=numbers.inject(0,:+)
    end

    def evens string
      numbers = intize *(splatUnpacker string)
      @evenQuantity=numbers.keep_if {|e| e.even? } .size
    end

    def randomer *args
      begin
        bounds = intize *args
        @randomNumber = Random.rand (Range.new *bounds)
      rescue ArgumentError, NoMethodError
        # no args given
        @randomNumber = Random.rand()
      end
    end
  end

  # ROUTES -------------------------------------------------
  get '/' do
    "una lista de las rutas... -.-"
  end

  get '/sum/*' do
    sum params['splat'].first
    "<p> La sumatoria de #{params['splat']} es #{@sum}"
  end

  get '/even/*' do
    evens params['splat'].first
    "<p> La cantidad de numeros pares en la url es: #{@evenQuantity}"
  end
  
  get '/mcd/:a/:b' do |a,b|
    mcd(a,b)
    "<p> el MCD entre #{a} y #{b} es #{@mcd} </p>"
  end
  
  get '/mcm/:a/:b' do |a,b|
    mcm(a,b)
    "<p> El MCM entre #{a} y #{b} es #{@mcm} </p>"
  end

  post '/random' do
    randomer
    "<p> #{@randomNumber}</p>"
  end

  post '/random/:a/:b' do |a,b|
    randomer a,b
    "<p> #{@randomNumber}</p>"
  end

  run! if app_file == $0
end

