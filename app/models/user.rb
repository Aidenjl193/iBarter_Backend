class User < ApplicationRecord
  has_one_attached :avatar
  has_secure_password
  has_many :items
  has_many :item_offers, through: :items
  has_many :offers, through: :item_offers

  def incoming_offers
    offers.where(owner_id: self.id)
  end
end
