class CreateItemOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :item_offers, id: :uuid do |t|
      t.string :item_id
      t.string :offer_id

      t.timestamps
    end
  end
end
