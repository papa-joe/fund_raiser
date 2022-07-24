class RestaurantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :phone
  has_many :locations
  has_many :meals
end
