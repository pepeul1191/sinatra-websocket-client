require 'sinatra/base'
require_relative 'routes/home'

class App < Sinatra::Base
  set :root, File.dirname(__FILE__)
  enable :sessions
  #registro de rutas
  register Sinatra::App::Routing::Home
end
