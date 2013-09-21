class AddDateToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :reservation_date, :datetime
  end
end
