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
            'home'
          end
          #routess
          app.get  '/', &index
        end
      end
    end
  end
end
