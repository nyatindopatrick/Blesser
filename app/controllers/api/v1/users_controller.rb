module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authorized, only: [:new, :create]

      def create
        user = User.new(user_params)
        if user.save
          session[:user_id] = user.id
          render json: UserSerializer.new(user).serialized_json
        else
          render json: { error: users.errors.messages }, status: 422
        end
      end

      private

      def user_params
        params.permit(:name, :email, :password)
      end
    end
  end
end
