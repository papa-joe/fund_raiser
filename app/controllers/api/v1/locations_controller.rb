class Api::V1::LocationsController < ApplicationController
    before_action :check_login, only: %i[create]

    def index
        render json: Location.all
    end

    def show
        render json: Location.find(params[:id])
    end

    def create
        location = current_restaurant.locations.build({address: params[:address], city: params[:city], zipcode: params[:zipcode], state: params[:state], phone: params[:phone]})

        if location.save
            render json: location, status: :created
        else
            render json: { errors: location.errors }, status: :unprocessable_entity
        end
    end
end
