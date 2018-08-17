module Sinatra
  module App
    module Routing
      module Departamento
        def self.registered(app)
          #filters
          app.before ['/departamento/*',] do
            check_csrf
          end
          #handlers
          listar = lambda do
            rpta = []
            status = 200
            begin
              rpta = Models::Departamento.all().to_a
            rescue Exception => e
              status = 500
              rpta = {
                :tipo_mensaje => 'error',
                :mensaje => [
                  'Se ha producido un error en listar los departamentos',
                  e.message
                ]}
            end
            status status
            rpta.to_json
          end
          #routes
          app.get  '/departamento/listar', &listar
        end
      end
    end
  end
end
