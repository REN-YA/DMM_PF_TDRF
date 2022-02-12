class RenameImageColumnToStores < ActiveRecord::Migration[5.2]
  def change
    rename_column :stores, :image, :image_id
  end
end
