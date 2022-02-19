class RenameUseIdColumnToRelationships < ActiveRecord::Migration[5.2]
  def change
    rename_column :relationships, :use_id, :followed_id
  end
end
