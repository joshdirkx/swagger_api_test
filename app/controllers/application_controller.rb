class ApplicationController < ActionController::API
  before_action :require_parameters

  rescue_from ActionController::ParameterMissing do |err|
    render json: { message: err }, status: :bad_request
  end

  private

  # rename to auto_params or some generic namespace / convention
  def parameters
    params.permit(permitted_params)
  end

  def require_parameters
    required_params.each do |req_param|
      raise ActionController::ParameterMissing.new(req_param) unless parameters[req_param]
    end
  end

  def required_params
    documentation_class.send(request.parameters['action'])[:parameters].map do |parameter|
      parameter[:name] if parameter[:required] == true
    end.compact
  end

  def permitted_params
    documentation_class.send(request.parameters['action'])[:parameters].map do |parameter|
      parameter[:name]
    end
  end

  def documentation_class
    @documentation_class ||= self.class.to_s.sub('Controller', 'Documentation').constantize.new
  end

end

