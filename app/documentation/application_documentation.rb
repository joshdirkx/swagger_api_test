class ApplicationDocumentation
  include Documentation

  protected

  def model_response
    @model_response ||= set_model_response
  end
end
