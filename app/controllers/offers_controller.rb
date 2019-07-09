class OffersController < ApplicationController
  before_action :authenticate_user, only: [:create]
  
  def create
    Offer.create(offer_params)
  end

  private

  def offer_params
    params.require(:item).permit(item_ids: [])
  end
end
