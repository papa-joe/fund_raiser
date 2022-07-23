class Location < ApplicationRecord
  validates :restaurant_id, presence: true
  belongs_to :restaurant
end
