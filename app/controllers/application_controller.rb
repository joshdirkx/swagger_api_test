class ApplicationController < ActionController::API

  private
  def parameters
    params.permit(permitted_params)
  end

  def permitted_params
    self.class.to_s.sub('Controller', 'Documentation').constantize.new.send(request.parameters['action'])[:parameters].map do |parameter|
      parameter[:name]
    end
  end

end

