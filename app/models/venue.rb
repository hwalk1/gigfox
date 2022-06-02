class Venue < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :price_per_hour, presence: true
  validates :room_size, presence: true, inclusion: { in: %w(Small Medium Large Extra-Large Stadium)}

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
