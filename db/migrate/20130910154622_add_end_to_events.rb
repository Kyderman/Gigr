class AddEndToEvents < ActiveRecord::Migration
  def change
    add_column :events, :end, :DateTime
    rename_column :events, :date, :start
  end
end
