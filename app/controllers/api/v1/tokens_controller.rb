class Api::V1::TokensController < ApplicationController

  def sign_in
    @restaurant = Restaurant.find_by_email(params[:email])

    if @restaurant&.authenticate(params[:password])
      render json: {
        token: JsonWebToken.encode(restaurant_id: @restaurant.id),
        email: @restaurant.email
      }
    else
      render json: {
        status: "failed",
        message: "Unauthenticated"
      }
    end

  end

  def login
    @user = User.find_by_email(params[:email])

    if @user&.authenticate(params[:password])
      render json: {
        status: "success",
        token: JsonWebToken.encode(user_id: @user.id),
        email: @user.email
      }
    else
      render json: {
        status: "failed",
        message: "Unauthenticated"
      }
    end

  end

  private

  # Only allow a trusted parameter "white list" through.
  def restaurant_params
    params.require(:restaurant).permit(:email, :password)
  end

end