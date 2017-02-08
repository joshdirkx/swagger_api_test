module Documentation
  extend ActiveSupport::Concern

  included do
    Swagger::Blocks
  end
  
  def generate_documentation
    swagger_root do
      key :swagger, '2.0'
      info do
        key :title, 'SwaggerApiTest'
        key :description, 'The Best'
      end
      key :host, 'localhost:3000'
      key :basePath, '/'
      key :produces, ['application/json']
    end

    routes = Documentation::Routes.build
    routes.each do |route|
      route = Documentation::Route.new(route)
      build_swagger_path(route)
    end
  end

  private

  def build_swagger_path(route)
    swagger_path "#{route.uri_pattern}" do
      operation route.http_protocol do
        key :description, route.controller_action_parameters[:description]

        route.controller_action_parameters[:parameters].each do |param|
          parameter do
            key :name, param[:name]
            key :in, param[:in]
            key :required, param[:required]
            key :type, param[:type]
            key :description, param[:description]
          end
        end

        route.controller_action_parameters[:responses].each do |resp|
          response resp[:status_code] do
            key :description, resp[:description]

            code = resp[:status_code]

            schema do
              route.controller_action_parameters[:response_objects][code.to_s][:properties].each do |prop|
                property prop[:name] do
                  key :type, prop[:type]
                end
              end
            end

          end
        end

      end
    end
  end

end

