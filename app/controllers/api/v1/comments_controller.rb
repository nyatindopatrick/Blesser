module Api
  module V1
    class CommentsController < ApplicationController
      protect_from_forgery with: :null_session

      def create
        comment = Comment.new(comment_params)
        comment.blessing_id = params[:blessing_id]
        if comment.save
          render json: { success: "comment successful!" }
        else
          render json: { error: comment.errors.messages }, status: 422
        end
      end

      def destroy
        comment = Comment.find_by(blessing_id: params[:id])
        if comment.destroy
          head :no_content
        else
          render json: { error: comment.errors.messages }, status: 422
        end
      end

      private

      def comment_params
        params.require(:comment).permit(:content)
      end
    end
  end
end
