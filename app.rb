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
  #registro de initializers
  Dir["./config/initializers/*.rb"].each {|file| require file }
  #registro de modelos
  Dir["./models/*.rb"].each {|file| require file }
  #registro de helpers
  helpers Sinatra::App::Helpers
  #registro de rutas
  register Sinatra::App::Routing::Home
  register Sinatra::App::Routing::Departamento
end
