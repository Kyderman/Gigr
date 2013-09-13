class CreateMusiciansInstruments < ActiveRecord::Migration
  def change
    create_table :musicians_instruments do |t|
      t.integer :musician_id
      t.integer :instrument_id

      t.timestamps
    end
    add_index :musicians_instruments, :musician_id
    add_index :musicians_instruments, :instrument_id
    add_index :musicians_instruments, [:musician_id, :instrument_id], unique: true
  end
end
