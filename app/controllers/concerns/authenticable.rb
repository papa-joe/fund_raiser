module Authenticable
    def current_restaurant
        return @current_restaurant if @current_restaurant

        header = request.headers['Authorization']
        return nil if header.nil?

        decoded = JsonWebToken.decode(header)
        @current_restaurant = Restaurant.find(decoded[:restaurant_id]) rescue
        ActiveRecord::RecordNotFound
    end

    def current_user
        return @current_user if @current_user

        header = request.headers['UserAuth']
        return nil if header.nil?

        decoded = JsonWebToken.decode(header)
        @current_user = User.find(decoded[:user_id]) rescue
        ActiveRecord::RecordNotFound
    end

    protected

    def check_login
        head :forbidden unless self.current_restaurant
    end

    def check_user_login
        head :forbidden unless self.current_user
    end
end