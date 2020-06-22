module Api
  module V1
    class BlessingsController < ApplicationController
      protect_from_forgery with: :null_session
      before_action :authorized, except: %i[index create]

      def index
        blessings = Blessing.all
        render json: blessings.to_json(include: %i[user comments likes])
      end

      def show
        blessing = Blessing.find(params[:id])
        render json: blessing.to_json(include: %i[user comments likes])
      end

      def create
        blessing = Blessing.new(blessing_params)
        if blessing.save
          render json: { success: "Blessing successful" }
        else
          render json: { error: blessing.errors.messages }, status: 422
        end
      end

      def update
        blessing = Blessing.find(params[:id])
        if blessing.update(blessing_params, options)
          render json: { success: "Blessing updated!" }
        else
          render json: { error: blessing.errors.messages }, status: 422
        end
      end

      def destroy
        blessing = Blessing.find(params[:id])
        if blessing.destroy
          head :no_content
        else
          render json: { error: blessing.errors.messages }, status: 422
        end
      end

      private

      def blessing_params
        params.permit(:content, :location, :image, :kind)
      end

      def options
        @options ||= { include: %i[comments] }
      end
    end
  end
end
