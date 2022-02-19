class AddLatitubeToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :latitube, :float
    add_column :stores, :longitube, :float
  end
end
