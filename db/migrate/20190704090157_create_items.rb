class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items, id: :uuid do |t|
      t.string :user_id
      t.string :name
      t.string :description
      t.string :condition

      t.timestamps
    end
  end
end
