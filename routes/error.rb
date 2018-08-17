module Sinatra
  module App
    module Routing
      module Error
        def self.registered(app)
          #handlers
          access = lambda do
            numero_error = params[:numero_error]
            error = ''
            puts numero_error
            case numero_error
            when '404'
              error = {
                :numero => 404,
                :mensaje => 'Archivo no encontrado',
                :descripcion => 'La página que busca no se encuentra en el servidor',
                :icono => 'fa fa-exclamation-triangle'
              }
            when '501'
              error = {
                :numero => 501,
                :mensaje => 'Página en Contrucción',
                :descripcion => 'Lamentamos el incoveniente, estamos trabajando en ello.',
                :icono => 'fa fa-code-fork'
              }
            when '505'
              error = {
                :numero => 505, :mensaje => 'Acceso restringido',
                :descripcion => 'Necesita estar logueado.',
                :icono => 'fa fa-ban'
              }
            when '8080'
              error = {
                :numero => 8080, :mensaje => 'Tiempo de la sesion agotado',
                :descripcion => 'Vuelva a ingresar al sistema.',
                :icono => 'fa fa-clock-o'
              }
            else

            end
            locals = {
              :constants => CONSTANTS,
              :csss => error_css(),
              :jss => error_js(),
              :error => error,
              :title => 'Error'
            }
            status numero_error
            erb :'error/access', :layout => :'layouts/blank', :locals => locals
          end
          #routes
          app.get  '/error/access/:numero_error', &access
        end
      end
    end
  end
end
