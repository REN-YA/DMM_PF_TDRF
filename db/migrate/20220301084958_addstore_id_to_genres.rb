class AddstoreIdToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :store_id, :integers
  end
end
