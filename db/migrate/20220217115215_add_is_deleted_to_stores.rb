class AddIsDeletedToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :is_deleted, :boolean, default: false
  end
end
