class AddDisplayFlagToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :display_flag, :boolean
  end
end
