class API::V1::BaseController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found(e)
    render json: {error: e.to_s}, status: :bad_request
  end

  def secret
    "hello"
  end


protected

  def authenticate_request!
    if !payload
      return invalid_authentication
    end

    load_current_user!
    invalid_authentication unless @current_user
  end

  def invalid_authentication
    render json: {error: 'Invalid Request'}, status: :unauthorized
  end
   
private
  def payload
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last
    JWT.decode(token,secret)
  rescue
    nil
  end

  def load_current_user!
    @current_user = User.find_by(id: payload[0]['user_id'])
  end
end
