class Api::V1::GroupsController < ApplicationController
    before_action :check_user_login, only: %i[create]
    before_action :check_owner, only: %i[update]

    def show
        @group = Group.find(params[:id])
        options = { include: [:user] }
        render json: GroupSerializer.new(@group, options
        ).serializable_hash
    end

    def index
        @groups = Group.all
        options = { include: [:user] }
        render json: GroupSerializer.new(@groups, options
        ).serializable_hash
    end

    def create
        group = current_user.groups.build({name: params[:name], group_type: params[:group_type], description: params[:description], cheque_name: params[:cheque_name], address: params[:address], city: params[:city], state: params[:state], zipcode: params[:zipcode]})

        if group.save
            options = { include: [:user] }
            render json: GroupSerializer.new(group, options
            ).serializable_hash, status: :created
        else
            render json: { errors: group.errors }, status: :unprocessable_entity
        end
    end

    def update
        @group = Group.find(params[:id])

        if @group.update({name: params[:name], group_type: params[:group_type], description: params[:description], cheque_name: params[:cheque_name], address: params[:address], city: params[:city], state: params[:state], zipcode: params[:zipcode]})
            render json: GroupSerializer.new(@group
            ).serializable_hash, status: :ok
        else
            render json: @group.errors, status: :unprocessable_entity
        end
    end

    private
    
    def check_owner
        @group = Group.find(params[:id])
        head :forbidden unless @group.user_id == current_user&.id
    end
end
