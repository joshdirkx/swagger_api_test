module Internal
  class DocumentationController < ApplicationController
    extend Documentation
    include Swagger::Blocks

    generate_documentation

    skip_before_action :require_parameters

    def index
      render json: Swagger::Blocks.build_root_json([Internal::DocumentationController])
    end

  end
end

