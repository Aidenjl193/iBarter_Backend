class Item < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :user
  has_many_attached :images
  has_many :item_offers
  has_many :offers, through: :item_offers

  def image_urls
    self.images.map do |image|
      rails_blob_path(image, only_path: true)
    end
  end
end
