class AddAcceptedToBandsEvents < ActiveRecord::Migration
  def change
    add_column :bands_events, :accepted, :boolean
  end
end
