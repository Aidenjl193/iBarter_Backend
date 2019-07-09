class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers, id: :uuid do |t|
      t.string :message
      t.boolean :accepted

      t.timestamps
    end
  end
end
