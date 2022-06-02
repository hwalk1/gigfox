class ChangeBookingTotalPriceToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :bookings, :total_price, :integer
  end
end
