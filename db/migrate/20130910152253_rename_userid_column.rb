class RenameUseridColumn < ActiveRecord::Migration
  def change
    rename_column :events, :user_id, :venue_id
  end
end
