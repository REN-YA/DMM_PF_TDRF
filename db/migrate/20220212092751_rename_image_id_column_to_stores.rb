class RenameImageIdColumnToStores < ActiveRecord::Migration[5.2]
  def change
    rename_column :stores, :image_id, :image
  end
end
