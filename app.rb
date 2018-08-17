require 'sinatra/base'

class App < Sinatra::Base
  #configuraciones
  set :root, File.dirname(__FILE__)
  set :session_secret, 'super secret'
  set :public_folder, File.dirname(__FILE__) + '/public'
  set :layout, 'views/layouts'
  enable :sessions
  #before all requests
  before do
    headers['server'] = 'Ruby, Ubuntu'
  end
  #registro de helpers
  helpers Sinatra::App::Helpers::Applicaction
  helpers Sinatra::App::Helpers::Filters
  helpers Sinatra::App::Helpers::LoginHelper
  #registro de rutas
  register Sinatra::App::Routing::Home
  register Sinatra::App::Routing::Departamento
  register Sinatra::App::Routing::Login
end
