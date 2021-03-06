class UsersController < ApplicationController
  
  def show
    user = User.find(params[:id])
    render json: user.to_json(
             :methods => :incoming_offers,
             :only => [:first_name, :last_name, :id],
             :include => {
               :items => {
                 :except => [:updated_at, :created_at, :user_id],
                 :methods => :image_urls
               },
               :offers => {
                 :except => [:updated_at, :created_at]
               }
             })
  end

  def create
    User.create(user_params)
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
