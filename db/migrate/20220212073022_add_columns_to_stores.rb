class AddColumnsToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :name, :string
    add_column :stores, :image_id, :string
    add_column :stores, :store_genres, :string
    add_column :stores, :post_code, :string
    add_column :stores, :address, :string
    add_column :stores, :business_hours, :string
    add_column :stores, :reservation_site, :string
    add_column :stores, :telephone_number, :string
  end
end
