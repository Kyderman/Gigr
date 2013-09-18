class AddAcceptedToBandsMusicians < ActiveRecord::Migration
  def change
    add_column :bands_musicians, :accepted, :boolean
  end
end
