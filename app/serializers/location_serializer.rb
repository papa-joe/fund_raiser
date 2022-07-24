class LocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :address, :city, :state, :zipcode
  belongs_to :restaurant
end
