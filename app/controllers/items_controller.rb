class ItemsController < ApplicationController
  before_action :authenticate_user, only: [:create]

  def index
    items = Item.all

    render json: items.to_json(
             :methods => :image_urls,
             :except => [:updated_at, :created_at])
  end

  def create
    if(current_user)
      new_params = item_params
      new_params.user_id = current_user.id
      Item.create!(new_params)
    end
  end


  private

  def item_params
    puts params
    params.require(:item).permit(:name, :condition, :description, images: [])
  end

end
