class CreateBandsEvents < ActiveRecord::Migration
  def change
    create_table :bands_events do |t|
      t.integer :band_id
      t.integer :event_id

      t.timestamps
    end
    add_index :bands_events, :band_id
    add_index :bands_events, :event_id
    add_index :bands_events, [:band_id, :event_id], unique: true
  end
end
