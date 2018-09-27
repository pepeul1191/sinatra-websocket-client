require 'httparty'

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
            response = HTTParty.get(
              CONSTANTS[:servicios][:chat][:url] + 'chat/messages?user_id=' + session[:user_id] + '&guest_id=' + params[:guest_id],
              headers: {
                CONSTANTS[:servicios][:chat][:csrf_key] => CONSTANTS[:servicios][:chat][:csrf_value],
                'Content-Type' => 'application/x-www-form-urlencoded',
                'charset' => 'utf-8'
              },
            )
            previous_messages = response.body
            locals = {
              :constants => CONSTANTS,
              :csss => login_css(),
              :jss => login_js(),
              :title => 'Home',
              :mensaje => '',
              :previous_messages => JSON.parse(previous_messages),
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
