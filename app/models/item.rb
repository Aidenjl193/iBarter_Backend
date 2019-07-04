class Item < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_many_attached :images

  def image_urls
    self.images.map do |image|
      rails_blob_path(image, only_path: true)
    end
  end
end
