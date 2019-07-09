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

  def create_offer
    item = Item.find(params[:id])
    if(item)
      offer = Offer.create(offer_params)
      offer.update({owner_id: item.user_id})
      #set this item
      offer.items_offers.build({item_id: item.id})
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :condition, :description, images: []).merge(user_id: current_user.id)
  end

  def offer_params
    params.require(:offer).permit(:message, item_ids: [])
  end

end
