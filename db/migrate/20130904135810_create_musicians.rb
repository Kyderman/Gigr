class CreateMusicians < ActiveRecord::Migration
  def change
    create_table :musicians do |t|
      t.string :name
      t.string :instrument
      t.integer :user_id

      t.timestamps
    end
  end
end
