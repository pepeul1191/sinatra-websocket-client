module Sinatra
  module App
    module Routing
      module Login
        def self.registered(app)
          #filters
          app.before ['/login',] do
            check_session_false
          end
          app.before ['/login/ver',] do
            check_session_true
          end
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

          ver = lambda do
            rpta = ''
            status = 200
            begin
              rpta = rpta + 'estado : ' + session[:activo].to_s + '<br>'
              rpta = rpta + 'momento : ' + session[:momento].to_s + '<br>'
              rpta = rpta + 'usuario : ' + session[:usuario] + '<br>'
              rpta = rpta + 'user_id : ' + session[:user_id].to_s + '<br>'
            rescue TypeError => e
              execption = e
              status = 500
              rpta = {
                :tipo_mensaje => 'error',
                :mensaje => [
                  'Se ha producido un error en mostrar los datos de la sesión',
                  execption.message
                ]}.to_json
            end
            status status
            rpta
          end

          acceder = lambda do
            mensaje = ''
            continuar = true
            csrf_key = CONSTANTS[:csrf][:key]
            csrf_val = CONSTANTS[:csrf][:secret]
            csrf_req = params[csrf_key]
            user = nil
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
                user = Models::User.where(:user => usuario, :password => contrasenia).first()
                if user == nil then
                  mensaje = 'Usuario y/o contraenia no coinciden'
                  continuar = false
                end
              end
            end
            if continuar == true then
              session[:activo] = true
              session[:momento] = Time.now
              session[:usuario] = usuario
              session[:user_id] = user.id
              redirect '/accesos/'
            else
              locals = {
                :constants => CONSTANTS,
                :csss => login_css(),
                :jss => login_js(),
                :title => 'Bienvenido',
                :mensaje => mensaje,
              }
          		erb :'login/index', :layout => :'layouts/blank', :locals => locals
            end
          end

          cerrar = lambda do
            session.clear
            redirect '/login'
          end
          #routes
          app.get  '/login', &index
          app.post '/login/acceder', &acceder
          app.get  '/login/ver', &ver
          app.get  '/login/cerrar', &cerrar
        end
      end
    end
  end
end
