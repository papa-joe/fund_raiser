class Api::V1::UsersController < ApplicationController
    before_action :check_owner, only: %i[update destroy]

     # GET /users/1
    def show
        @user = User.find(params[:id])
        options = { include: [:groups] }
        render json: UserSerializer.new(@user, options).serializable_hash
    end

    def index
        @users = User.all
        options = { include: [:groups] }
        render json: UserSerializer.new(@users, options).serializable_hash
    end

    # POST /users
    def register
        @user = User.new({email: params[:email],firstname: params[:firstname],lastname: params[:lastname],email: params[:email],password: params[:password]})

        if @user.save
            render json: UserSerializer.new(@user).serializable_hash, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

     # PATCH/PUT /users/1
    def update
        @user = User.find(params[:id])

        if @user.update({firstname: params[:firstname],lastname: params[:lastname],email: params[:email]})
            render json: UserSerializer.new(@user).serializable_hash
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

     # DELETE /users/1
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        head 204
    end

    private

    def check_owner
        @user = User.find(params[:id])
        head :forbidden unless @user.id == current_user&.id
    end
end
