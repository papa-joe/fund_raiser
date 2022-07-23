class Api::V1::RestaurantsController < ApplicationController
    before_action :set_restaurant, only: %i[show update destroy]
    before_action :check_owner, only: %i[update destroy]

    # GET /users/1
    def show
        render json: @restaurant
    end

    def create
        @restaurant = Restaurant.new({name: params[:name],firstname: params[:firstname],lastname: params[:lastname],email: params[:email],phone: params[:phone],password: params[:password],location_no: params[:location_no],from_time: params[:from_time],to_time: params[:to_time],avg_menu_price: params[:avg_menu_price],percent_donation: params[:percent_donation],website: params[:website],logo: params[:logo]})

        if @restaurant.save
            render json: @restaurant, status: :created
        else
            render json: @restaurant.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /users/1
    def update
        @restaurant = Restaurant.find(params[:id])

        if @restaurant.update({firstname: params[:firstname],lastname: params[:lastname],email: params[:email],phone: params[:phone],location_no: params[:location_no],from_time: params[:from_time],to_time: params[:to_time],avg_menu_price: params[:avg_menu_price],percent_donation: params[:percent_donation],website: params[:website],logo: params[:logo]})
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
