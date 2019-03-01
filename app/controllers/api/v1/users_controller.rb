class Api::V1::UsersController < API::V1::BaseController
  def show
    user = User.find(params[:id])

    render json: user, serializer: UserSerializer
  end

  def index
    users  = User.all

    render json: users, each_serializer: UserSerializer
  end
end
