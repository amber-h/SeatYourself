class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :addr
      t.string :phone
      t.integer :seats
      t.string :picture
      t.string :open_hour
      t.string :close_hour

      t.timestamps
    end
  end
end
