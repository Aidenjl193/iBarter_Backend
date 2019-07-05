class UsersController < ApplicationController
  before_action :authenticate_user
  
  def show
    user = User.find(params[:id])

    render json: user
  end

  def create
    User.create(user_params)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
