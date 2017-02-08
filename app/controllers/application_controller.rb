class ApplicationController < ActionController::API
  protected

  def generate_parameter_list(controller_action)
    controller_action[:parameters].map do |parameter|
      parameter[:name]
    end
  end
end
