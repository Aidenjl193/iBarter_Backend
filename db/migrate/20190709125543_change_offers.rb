class ChangeOffers < ActiveRecord::Migration[5.2]
  def change
    change_table(:offers) do |t|
      t.column :owner_id, :uuid
    end
  end
end
