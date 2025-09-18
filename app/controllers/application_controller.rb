class ApplicationController < ActionController::API

  before_action :authenticate_client!

  def authenticate_client!
    token = request.headers['Authorization']&.split(' ')&.last
    unless ApiToken.exists?(token: token, active: true)
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
