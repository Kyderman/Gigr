class CreateBandsMusicians < ActiveRecord::Migration
  def change
    create_table :bands_musicians do |t|
      t.integer :band_id
      t.integer :musician_id

      t.timestamps
    end
    add_index :bands_musicians, :band_id
    add_index :bands_musicians, :musician_id
    add_index :bands_musicians, [:band_id, :musician_id], unique: true
  end
end
