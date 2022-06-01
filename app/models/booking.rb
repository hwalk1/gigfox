class Booking < ApplicationRecord
  attr_accessor :duration
  belongs_to :user
  belongs_to :venue

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :total_price, presence: true

  enum status: {
    pending: 0,
    active: 1,
    archived: 2
  }
end
