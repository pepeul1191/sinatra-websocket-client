module Sinatra
  module App
    module Routing
      module Home
        def self.registered(app)
          #filters
          app.before ['/', '/accesos/'] do
            check_session_true
          end
          #handlers
          index = lambda do
            locals = {
              :constants => CONSTANTS,
              :csss => helper_home_index_css(),
              :jss => helper_home_index_js(),
              :title => 'Home',
              :mensaje => ''
            }
        		erb :'home/index', :layout => :'layouts/app', :locals => locals
          end
          #routess
          app.get  '/', &index
        end
      end
    end
  end
end
