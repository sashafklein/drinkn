class ApiController < ApplicationController
  
  before_action :ensure_member!  
  
  respond_to :json

  private

  def ensure_member!
    # binding.pry
    # permission_denied_error unless current_user && user_signed_in?
    true
  end
  
  def permission_denied_error
    error(403, 'Permission Denied!')
  end

  def error(status, message = 'Something went wrong')
    response = {
      response_type: "ERROR",
      message: message
    }

    render json: response.to_json, status: status
  end
end
