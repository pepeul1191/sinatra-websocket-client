require 'sinatra/base'

class App < Sinatra::Base
  #configuraciones
  set :root, File.dirname(__FILE__)
  enable :sessions
  #before all requests
  before do
    headers['server'] = 'Ruby, Ubuntu'
  end
  #registro de helpers
  helpers Sinatra::App::Helpers::Applicaction
  #registro de rutas
  register Sinatra::App::Routing::Home
  register Sinatra::App::Routing::Departamento
end
