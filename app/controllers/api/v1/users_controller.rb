class Api::V1::UsersController < API::V1::BaseController
  def show
    user = User.find(params[:id])
    render json: user, serializer: UserSerializer
  end

  def index
    users  = User.all
    render json: users, each_serializer: UserSerializer
  end

  def new

  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json:@user, status: :created,  serializer: UserSerializer
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      render json:@user, status: :ok,  serializer: UserSerializer
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
  end


  private

  def user_params
    params.permit(:name, :email, :password, :username)
  end

end