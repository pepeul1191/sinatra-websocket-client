module Sinatra
  module App
    module Routing
      module Home
        def self.registered(app)
          #handlers
          index = lambda do
            check_csrf
            'home'
          end
          #routes
          app.get  '/', &index
        end
      end
    end
  end
end
