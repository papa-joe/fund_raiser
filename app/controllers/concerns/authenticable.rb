module Authenticable
    def current_restaurant
        return @current_restaurant if @current_restaurant

        header = request.headers['Authorization']
        return nil if header.nil?

        decoded = JsonWebToken.decode(header)
        @current_restaurant = Restaurant.find(decoded[:restaurant_id]) rescue
        ActiveRecord::RecordNotFound
    end
end