module Documentation
  class Routes

    def self.build
      new.generate_raw_routes_from_rake_task
    end

    def generate_raw_routes_from_rake_task
      routes_as_strings = rake_routes
      routes_as_strings = routes_as_strings.split("\n")

      split_string_routes = []
      routes_as_strings.each do |i|
        split_string_routes.push(i.split)
      end

      @full_raw_routes_array = split_string_routes
      sanitize_routes
    end

    private

    #
    # Get all the routes. TODO should be something like
    # Rake::Tasks['routes'].invoke
    #
    def rake_routes
      all_routes = Rails.application.routes.routes

      require 'action_dispatch/routing/inspector'
      inspector = ActionDispatch::Routing::RoutesInspector.new(all_routes)
      inspector.format(ActionDispatch::Routing::ConsoleFormatter.new, ENV['CONTROLLER'])
    end

    def sanitize_routes
      @full_raw_routes_array.shift
      @full_raw_routes_array.pop
      @full_raw_routes_array
    end

  end
end
