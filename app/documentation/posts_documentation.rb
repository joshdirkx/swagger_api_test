class PostsDocumentation < ApplicationDocumentation

  def index
    {
      description: 'Index desc',
      parameters: nil,
      responses: [
        {
          status_code: 200,
          description: 'Success',
          schema: :success
        }
      ],
      response_objects: {
        '200' => {
          name: 'Success schema',
          properties: [
            {
              name: :author,
              type: :string
            },
            {
              name: :text,
              type: :string
            }
          ]
        }
      }
    }
  end

  def show
    #define_swagger show do
    #  description 'Show some stuff'
    #  parameters do
    #    define_parameter name: :id
    #    define_parameter name: :some_value, type: :boolean, in: :query
    #  end
    #  response do
    #    status 200 do
    #      description 'Success'
    #      properties model_response
    #    end
    #    
    #    status 400 do
    #      description 'Bad Request'
    #      properties bad_request
    #    end

    #    status 404 do
    #      description 'Not Found'
    #      properties not_found
    #    end
    #  end
    #end

    {
      description: 'Index desc',
      parameters: [
        define_parameter(name: :id), define_parameter(name: :fake, required: true)
      ],
      responses: [
        {
          status_code: 200,
          description: 'Success',
          schema: :success
        }
      ],
      response_objects: {
        '200' => {
          name: 'Success schema',
          properties: model_response
       }
      }
    }

  end

  def create
    {
      description: 'Index desc',
      parameters: [
        {
          name: 'something',
          in: :path,
          description: 'index something desc',
          required: true,
          type: :string
        }
      ],
      responses: [
        {
          status_code: 200,
          description: 'Success',
          schema: :success
        }
      ],
      response_objects: {
        '200' => {
          name: 'Success schema',
          properties: [
            {
              name: :author,
              type: :string
            },
            {
              name: :text,
              type: :string
            }
          ]
        }
      }
    }

  end

  def update
    {
      description: 'Index desc',
      parameters: [
        {
          name: 'something',
          in: :path,
          description: 'index something desc',
          required: true,
          type: :string
        }
      ],
      responses: [
        {
          status_code: 200,
          description: 'Success',
          schema: :success
        }
      ],
      response_objects: {
        '200' => {
          name: 'Success schema',
          properties: [
            {
              name: :author,
              type: :string
            },
            {
              name: :text,
              type: :string
            }
          ]
        }
      }
    }

  end

  def destroy
    {
      description: 'Index desc',
      parameters: [
        {
          name: 'something',
          in: :path,
          description: 'index something desc',
          required: true,
          type: :string
        }
      ],
      responses: [
        {
          status_code: 200,
          description: 'Success',
          schema: :success
        }
      ],
      response_objects: {
        '200' => {
          name: 'Success schema',
          properties: [
            {
              name: :author,
              type: :string
            },
            {
              name: :text,
              type: :string
            }
          ]
        }
      }
    }

  end

end

