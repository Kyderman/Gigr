class AddDefaultValueToAccepted < ActiveRecord::Migration
  def change
    change_column_default :bands_musicians, :accepted, false
    change_column_default :bands_events, :accepted, false
  end
end
