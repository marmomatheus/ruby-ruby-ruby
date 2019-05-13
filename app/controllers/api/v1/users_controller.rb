module Api
  module V1
    class UsersController < ApplicationController   
			def index
					users = User.getAll
          render json: { data:users } ,status: :ok\
      end

      def show
				user = User.find(params[:id])
				render json: { data:user },status: :ok
      end
      
      def create
				user = User.new(user_params)
				if user.save
					render json: { data:user },status: :ok
				else
					render json: { data:user.errors },status: :unprocessable_entity
				end
      end

      def destroy
				user = User.find(params[:id])
				user.destroy
				render json: { data:user },status: :ok
      end
      
			def update
				user = User.find(params[:id])
				if user.update_attributes(user_params)
					render json: { data:user },status: :ok
				else
					render json: { data:user.errors },status: :unprocessable_entity
				end
			end
      
      private
			def user_params
				params.permit(:name, :email)
			end
    end
  end
end
