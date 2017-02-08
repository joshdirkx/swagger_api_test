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

  def define_parameter(options = {})
    {
      name: options[:name],
      in: options[:in] || :path,
      required: options[:required] || false,
      type: options[:type] || :string,
      description: options[:description] || "Write a short description for `#{options[:name]}`"
    }
  end

  def set_model_response
    klass = self.class.to_s.sub('Documentation','').singularize.constantize
    klass.attribute_types.map do |attr, obj_type|
      {
        name: attr,
        type: obj_type.type
      }
    end
  end

  private

  def build_swagger_path(route)
    swagger_path "#{route.uri_pattern}" do
      operation route.http_protocol do
        key :description, route.controller_action_parameters[:description]

        route.controller_action_parameters[:parameters]&.each do |param|
          parameter do
            key :name, param[:name]
            key :in, param[:in]
            key :required, param[:required]
            key :type, param[:type]
            key :description, param[:description]
          end
        end

        route.controller_action_parameters[:responses]&.each do |resp|
          response resp[:status_code] do
            key :description, resp[:description]

            code = resp[:status_code]

            schema do
              route.controller_action_parameters[:response_objects][code.to_s][:properties]&.each do |prop|
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

