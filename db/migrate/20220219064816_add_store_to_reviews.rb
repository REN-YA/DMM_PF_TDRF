class AddStoreToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :store_evaluation, :float
  end
end
