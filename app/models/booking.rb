class Booking < ApplicationRecord
  attr_accessor :duration
  belongs_to :user
  belongs_to :venue

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :total_price, presence: true
  validates :status, presence: true, inclusion: [1, 2, 3]
  validates :venue_id, presence: true
  validates :user_id, presence: true
end
