class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.references :product
      t.string :contents
      t.timestamps
    end
  end
end
