class Offer < ApplicationRecord
  has_many :item_offers
  has_many :items, through: :item_offers
  has_many :users, through: :items

  def item_ids=(ids)
    ids.each do |id|
      self.item_offers.build(item_id: id)
    end
  end
end
