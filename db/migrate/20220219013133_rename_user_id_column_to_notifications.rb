class RenameUserIdColumnToNotifications < ActiveRecord::Migration[5.2]
  def change
    rename_column :notifications, :user_id, :visiter_id
    rename_column :notifications, :use_id, :visited_id
  end
end
