require 'sinatra/base'

module Middlewares
  class ReplaceNumbers < Sinatra::Base
    after do
      body.map! {|entry| entry.gsub /[0-9]/, 'x'}
    end
  end

  class XCharacterCount < Sinatra::Base
    after do
      xRepetitions = body.map {|line| line.count 'x'} .sum
      headers "X-Xs-Count" => xRepetitions.to_s
    end
  end
end
