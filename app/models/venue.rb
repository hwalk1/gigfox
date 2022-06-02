class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :price_per_hour, presence: true
  validates :room_size, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
