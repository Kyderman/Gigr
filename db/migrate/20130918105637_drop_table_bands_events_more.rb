class DropTableBandsEventsMore < ActiveRecord::Migration
  def change
    drop_table :bands_invites
    drop_table :events_invites
    drop_table :mus_eve_invites
  end
end
