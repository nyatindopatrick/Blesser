module Api
  module V1
    class SessionsController < ApplicationController
      protect_from_forgery with: :null_session
      skip_before_action :authorized, only: [:create]

      def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          render json: { user: user }
        else
          render json: { error: "Check your username or password." }
        end
      end

      def destroy
        session[:user_id] = nil
        render json: { success: 'You\'re logged out' }
      end
    end
  end
end
