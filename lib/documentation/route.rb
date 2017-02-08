module Documentation
  class Route

    attr_accessor :http_protocol,
                  :uri_pattern,
                  :controller_action_parameters,
                  :input

    # @param input [Array]
    #
    # Array of a single route generated via "rake routes", split
    # into either three or four items depending on if the route had
    # a prefix / quick path
    # ["GET", "/foo/bar/:bar_id(.:format)", "foo/bar#fubar"]
    # ["foo_bar_path", "GET", "/foo/bar/:bar_id(.:format)", "foo/bar#fubar"]
    def initialize(input)
      @input = input

      @controller_action_parameters = get_controller_action_parameters
      @http_protocol = get_http_protocol
      @uri_pattern = get_uri_pattern
    end

    private

    #
    # Get controller_action_name from current raw route array.
    #
    def get_controller_action_parameters
      controller, action = @input[-1].split("#")

      controller = controller.split("/").map! do |class_name|
        class_name.camelcase 
      end.join("::") + "Documentation"

      full_controller_action_path = controller.constantize.new.send(action)
    end

    #
    # Get http_protocol from current raw route array.
    #
    def get_http_protocol
      @input[-3].downcase.to_sym
    end

    #
    # Get uri_pattern from current raw route array by removing the trailing
    # (.format) from the path defintion and wrapping all input parameters in
    # brackets
    #
    def get_uri_pattern
      raw_uri_pattern = @input[-2]
      # Grab route from current line, remove trailing (.:format)
      route = raw_uri_pattern.sub(/\(.*\)/, '')
      # Find all parameters in the route string and wrap them in brackets
      route.gsub!(/(:\w[^\/]*)/, '{\1}')
      route
    end

  end
end
