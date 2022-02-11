class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :use_id
      t.integer :stored_id
      t.integer :review_id
      t.string :action
      t.string :check

      t.timestamps
    end
  end
end
