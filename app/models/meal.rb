class Meal < ApplicationRecord
  validates :restaurant_id, :user_id, :location_id, presence: true
  validates :attendance, numericality: { greater_than_or_equal_to: 20
}, presence: true
  belongs_to :user
  belongs_to :restaurant
  belongs_to :location
end
