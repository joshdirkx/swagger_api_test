class PostsDocumentation < ApplicationDocumentation

  def index
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

  def show
    {
      description: 'Index desc',
      parameters: [
        define_parameter(name: :id), define_parameter(name: :fake)
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

