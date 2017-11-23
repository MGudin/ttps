require 'rack'

require_relative 'app'


app = Proc.new do |env|
  Mol.run

  [
    "#{Mol.statusCode}",
    {},
    ['Number: ', "#{Mol.number}", ', status: ', "#{Mol.statusCode}" ]
  ]
end

Rack::Handler::WEBrick.run app
