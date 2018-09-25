module Sinatra
  module App
    module Helpers
      module HomeHelper
        def login_css
          rpta = nil
          if CONSTANTS[:ambiente] == 'desarrollo'
            rpta = [
              'bower_components/bootstrap/dist/css/bootstrap.min',
              'bower_components/font-awesome/css/font-awesome.min',
              'bower_components/swp-backbone/assets/css/constants',
              'assets/css/constants',
              'assets/css/home',
            ]
          else
            rpta = [
              'dist/home.min',
            ]
          end
          rpta
        end

        def login_js
          rpta = nil
          if CONSTANTS[:ambiente] == 'desarrollo'
            rpta = [
              'bower_components/jquery/dist/jquery.min',
              'bower_components/bootstrap/dist/js/bootstrap.min',
              'bower_components/jquery-simple-websocket/dist/jquery.simple.websocket.min',
              'assets/js/app',
            ]
          else
            rpta = [
            ]
          end
          rpta
        end
      end
    end
  end
end
