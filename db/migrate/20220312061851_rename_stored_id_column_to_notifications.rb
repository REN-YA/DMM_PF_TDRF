class RenameStoredIdColumnToNotifications < ActiveRecord::Migration[5.2]
  def change
    rename_column :notifications, :stored_id, :store_id
  end
end
