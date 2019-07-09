class ItemOffer < ApplicationRecord
  belongs_to :item
  has_one :user, through: :item
  belongs_to :offer
end
