class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :date
      t.string :time
      t.integer :partySize

      t.timestamps
    end
  end
end
