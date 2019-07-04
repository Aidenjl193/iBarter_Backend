class ItemsController < ApplicationController

  def index
    items = Item.all

    render json: items.to_json(
             :methods => :image_urls,
             :except => [:updated_at, :created_at])
  end

  def create
    Item.create!(item_params)
  end


private

  def item_params
    params.require(:item).permit(:name, :condition, :description, images: [])
  end
end
