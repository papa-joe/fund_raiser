class Api::V1::RestaurantsController < ApplicationController
    before_action :set_restaurant, only: %i[show update destroy]
    before_action :check_owner, only: %i[update destroy]

    # GET /users/1
    def show
        render json: @restaurant
    end

    def sign_up

        if !params[:address].present? || !params[:city].present? || !params[:zipcode].present? || !params[:state].present? || !params[:phone].present? 
            render json: { status: "failed", message: "Enter at least one location"}
            return
        end

        @restaurant = Restaurant.new({name: params[:name],firstname: params[:firstname],lastname: params[:lastname],email: params[:email],phone: params[:phone],password: params[:password],location_no: params[:location_no],from_time: params[:from_time],to_time: params[:to_time],avg_menu_price: params[:avg_menu_price],percent_donation: params[:percent_donation],website: params[:website],logo: params[:logo], monday: params[:monday], tuesday: params[:tuesday], wednesday: params[:wednesday], thursday: params[:thursday], friday: params[:friday], saturday: params[:saturday], sunday: params[:sunday], tax: params[:tax], leader_arrival: params[:leader_arrival], alcohol_sales: params[:alcohol_sales], coupons: params[:coupons]})

        if @restaurant.save

            @res_day = Restaurant.find_by_email(params[:email])

            location = @res_day.locations.build({address: params[:address], city: params[:city], zipcode: params[:zipcode], state: params[:state], phone: params[:phone]})

            if location.save
                render json: @restaurant, status: :created
            else
                render json: @restaurant.errors, status: :unprocessable_entity
            end
        else
            render json: @restaurant.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /users/1
    def update
        @restaurant = Restaurant.find(params[:id])

        if @restaurant.update({name: params[:name],firstname: params[:firstname],lastname: params[:lastname],email: params[:email],phone: params[:phone],location_no: params[:location_no],from_time: params[:from_time],to_time: params[:to_time],avg_menu_price: params[:avg_menu_price],percent_donation: params[:percent_donation],website: params[:website],logo: params[:logo], monday: params[:monday], tuesday: params[:tuesday], wednesday: params[:wednesday], thursday: params[:thursday], friday: params[:friday], saturday: params[:saturday], sunday: params[:sunday], tax: params[:tax], leader_arrival: params[:leader_arrival], alcohol_sales: params[:alcohol_sales], coupons: params[:coupons]})
            render json: @restaurant, status: :ok
        else
            render json: @restaurant.errors, status: :unprocessable_entity
        end
    end

    # DELETE /users/1
    def destroy
        @restaurant = Restaurant.find(params[:id])
        @restaurant.destroy
        head 204
    end

    private
    # Only allow a trusted parameter "white list" through.
    def retaurant_params
        params.require(:restaurant).permit(:name, :firstname, :lastname, :email, :phone, :password, :password_confirmation, :location_no, :from_time, :to_time, :avg_menu_price, :percent_donation, :website, :logo)
    end

    def retaurant_update_params
        params.require(:restaurant).permit(:name, :firstname, :lastname, :phone, :location_no, :from_time, :to_time, :avg_menu_price, :percent_donation, :website, :logo)
    end

    def set_restaurant
        @restaurant = Restaurant.find(params[:id])
    end

    def check_owner
        head :forbidden unless @restaurant.id == current_restaurant&.id
    end
end
