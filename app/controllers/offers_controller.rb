class OffersController < ApplicationController

  def show
    offer = Offer.find(params[:id])
    render json: offer.to_json(
             :include => {:item_offers => {}})
  end
end
