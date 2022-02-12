class RenameImageIdColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :image_id, :image
  end
end
