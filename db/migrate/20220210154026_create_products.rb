class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :store_id
      t.integer :genre_id
      t.string :name
      t.string :image_id
      t.integer :selling_price
      t.boolean :is_selling

      t.timestamps
    end
  end
end
