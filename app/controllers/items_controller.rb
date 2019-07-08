class ItemsController < ApplicationController
  before_action :authenticate_user, only: [:create]

  def index
    items = Item.all

    render json: items.to_json(
             :methods => :image_urls,
             :except => [:updated_at, :created_at],
             :include => {:user => {:only => [:first_name, :last_name, :id]}})
  end

  def create
    if(current_user)
      Item.create!(item_params)
    end
  end

  def show
    item = Item.find(params[:id])

    render json: item.to_json(
             :methods => :image_urls,
             :except => [:updated_at, :created_at])
  end


  private

  def item_params
    puts params
    params.require(:item).permit(:name, :condition, :description, images: []).merge(user_id: current_user.id)
  end

end
