class AddUseridToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :user_id, :integer
  end
end
