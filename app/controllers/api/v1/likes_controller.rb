module Api
  module V1
    class LikesController < ApplicationController
      protect_from_forgery with: :null_session

      def create
        like = Like.new(user_id: current_user.id, blessing_id: params[:id])
        like.save
      end

      def destroy
        like = Like.find_by(user_id: current_user.id, blessing_id: params[:id])
        if like.destroy
          head :no_content
        else
          render json: { error: likes.errors.messages }, status: 422
        end
      end
    end
  end
end
