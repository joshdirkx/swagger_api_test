module Internal
  class DocumentationController < ApplicationController
    extend Documentation
    include Swagger::Blocks

    generate_documentation

    def index
      render json: Swagger::Blocks.build_root_json([Internal::DocumentationController])
    end

  end
end

