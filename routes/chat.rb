module Sinatra
  module App
    module Routing
      module Chat
        def self.registered(app)
          #filters
          app.before ['/chat',] do
            check_session_true
          end
          #handlers
          index = lambda do
            locals = {
              :constants => CONSTANTS,
              :csss => login_css(),
              :jss => login_js(),
              :title => 'Home',
              :mensaje => ''
            }
            erb :'chat/index', :layout => :'layouts/app', :locals => locals
          end
          #routess
          app.get  '/chat/:guest_id', &index
        end
      end
    end
  end
end
