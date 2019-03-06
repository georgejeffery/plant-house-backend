class Api::V1::AuthenticationController < API::V1::BaseController
  require 'jwt'

  def create
    user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        auth_token = JWT.encode({user_id: user.id}, secret)
        render json: {auth_token: auth_token}, status: :ok
      else
        render json: {error: 'Login Unsuccessfull'}, status: :unauthorized
      end
  end

  def secret
    "hello"
  end

end

