class AddSongUrlToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :song_url, :string
  end
end
