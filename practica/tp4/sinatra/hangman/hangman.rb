require 'sinatra/base'

require_relative 'game'
class HangMan < Sinatra::Base
  include Game
  

  run! if app_file == $0
end
