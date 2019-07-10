class OffersController < ApplicationController

  def show
    offer = Offer.find(params[:id])
    render json: offer.to_json(
             :include => {:items => {}})
  end
end
