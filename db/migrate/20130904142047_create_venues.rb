class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :post_code
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
