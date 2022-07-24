class Api::V1::MealsController < ApplicationController
    before_action :check_user_login, only: %i[create]
    before_action :check_owner, only: %i[update show]

    def show
        @meal = Meal.find(params[:id])
        options = { include: [:user, :location, :restaurant] }
        render json: MealSerializer.new(@meal, options
        ).serializable_hash
    end

    def index
        @meals = Meal.all
        options = { include: [:user, :location, :restaurant] }
        render json: MealSerializer.new(@meals, options
        ).serializable_hash
    end

    def create
        meal = current_user.meals.build({attendance: params[:attendance], restaurant_id: params[:restaurant_id], location_id: params[:location_id]})

        if meal.save
            render json: meal, status: :created
        else
            render json: { errors: meal.errors }, status: :unprocessable_entity
        end
    end

    private
    
    def check_owner
        @meal = Meal.find(params[:id])
        render json: { errors: "Unauthorized" } unless @meal.user_id == current_user&.id || @meal.restaurant_id == current_restaurant&.id
    end
end
