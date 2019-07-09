class ItemOffer < ApplicationRecord
  belongs_to :item
  belongs_to :offer
end
