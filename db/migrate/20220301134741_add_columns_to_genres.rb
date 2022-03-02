class AddColumnsToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :store_id, :integer
  end
end
