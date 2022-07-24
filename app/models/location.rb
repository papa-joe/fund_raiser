class Location < ApplicationRecord
  validates :restaurant_id, presence: true
  has_many :meals, dependent: :destroy
  belongs_to :restaurant

  scope :filter_by_city, lambda { |keyword|
    where('lower(city) LIKE ?', "%#{keyword.downcase}%")
  }

  scope :recent, lambda {
    order(:updated_at)
  }

  def self.search(params = {})
    locations = params[:location_ids].present? ? Location.where(id: params[:location_ids]) : Location.all

    locations = locations.filter_by_city(params[:keyword]) if params[:keyword]

    locations = locations.recent if params[:recent]

    locations
  end
end
