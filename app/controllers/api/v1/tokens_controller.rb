class Api::V1::TokensController < ApplicationController

  def create
    @restaurant = Restaurant.find_by_email(params[:email])

    if @restaurant&.authenticate(params[:password])
      render json: {
        token: JsonWebToken.encode(restaurant_id: @restaurant.id),
        email: @restaurant.email
      }
    else
      head :unauthorized
    end

  end

  private

  # Only allow a trusted parameter "white list" through.
  def restaurant_params
    params.require(:restaurant).permit(:email, :password)
  end

end