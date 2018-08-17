require 'sinatra/base'
#require_relative 'routes/home'

class App < Sinatra::Base
  #configuraciones
  set :root, File.dirname(__FILE__)
  enable :sessions
  #before all requests
  before do
    headers['server'] = 'Ruby, Ubuntu'
  end
  #registro de rutas
  Dir["./routes/*.rb"].each {|file| require file }
  #registro de rutas
  register Sinatra::App::Routing::Home
end
