class OffersController < ApplicationController

  def show
    offer = Offer.find(params[:id])
    render json: offer.to_json(
             :include => {:items => {:methods => :image_urls}})
  end
end
