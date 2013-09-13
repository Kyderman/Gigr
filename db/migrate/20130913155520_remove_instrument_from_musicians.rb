class RemoveInstrumentFromMusicians < ActiveRecord::Migration
  def up
    remove_column :musicians, :instrument
  end

  def down
    add_column :musicians, :instrument, :string
  end
end
