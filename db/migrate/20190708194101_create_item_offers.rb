class CreateItemOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :item_offers, id: :uuid do |t|
      t.uuid :item_id
      t.uuid :offer_id

      t.timestamps
    end
  end
end
