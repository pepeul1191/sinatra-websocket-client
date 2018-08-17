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

          acceder = lambda do
            mensaje = ''
            continuar = true
            csrf_key = CONSTANTS[:csrf][:key]
            csrf_val = CONSTANTS[:csrf][:secret]
            csrf_req = params[csrf_key]
            if csrf_req == '' then
              mensaje = 'Token CSRF no existe en POST request'
              continuar = false
            else
              # validar csrf token
              if csrf_req != csrf_val then
                mensaje = 'Token CSRF no coincide en POST request'
                continuar = false
              end
              # validar usuario y contraseña si csrf token es correcto
              if continuar == true then
                usuario = params['usuario']
                contrasenia = params['contrasenia']
                if usuario != CONSTANTS[:login][:usuario] or contrasenia != CONSTANTS[:login][:contrasenia] then
                  mensaje = 'Usuario y/o contraenia no coinciden'
                  continuar = false
                end
              end
            end
            if continuar == true then
              session[:activo] = true
              session[:momento] = Time.now
              session[:usuario] = usuario
              redirect '/accesos/'
            else
              locals = {
                :constants => CONSTANTS,
                :csss => login_css(),
                :jss => login_js(),
                :title => 'Bienvenido',
                :mensaje => mensaje
              }
          		erb :'login/index', :layout => :'layouts/blank', :locals => locals
            end
          end
          #routes
          app.get  '/login', &index
          app.post '/login/acceder', &acceder
        end
      end
    end
  end
end
