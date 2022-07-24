class MealSerializer
  include FastJsonapi::ObjectSerializer
  attributes :attendance, :meal_date
  belongs_to :user
  belongs_to :restaurant
  belongs_to :location
end
