module Sinatra
  module App
    module Routing
      module Login
        def self.registered(app)
          #handlers
          index = lambda do
            locals = {
              :constants => CONSTANTS,
              :csss => login_css(),
              :jss => login_js(),
              :title => 'Bienvenido',
              :mensaje => ''
            }
        		erb :'login/index', :layout => :'layouts/blank', :locals => locals
          end
          #routes
          app.get  '/login', &index
        end
      end
    end
  end
end
