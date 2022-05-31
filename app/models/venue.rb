class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :price_per_hour, presence: true
  validates :room_size, presence: true
  validates :user_id, presence: true
end
