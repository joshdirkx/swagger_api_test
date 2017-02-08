class PostsDocumentation

  def index
    {
      description: 'Index desc',
      parameters: [
        {
          name: 'something',
          in: :path,
          description: 'index something desc',
          required: :true,
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
        {
          name: :id,
          in: :path,
          description: 'index something desc',
          required: :true,
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

  def create
    {
      description: 'Index desc',
      parameters: [
        {
          name: 'something',
          in: :path,
          description: 'index something desc',
          required: :true,
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
          required: :true,
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
          required: :true,
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

