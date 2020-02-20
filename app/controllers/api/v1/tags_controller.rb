module Api
  module V1
    class TagsController < ApplicationController
      before_action :authenticate_request!
      before_action :set_tag, only: [:show, :update]

      def index
        @tags = Tag.all
      end

      def show
      end

      def create
        @tag = Tag.new(tag_params)

        if @tag.save
          render :show, status: :created, location: @tag
        else
          render json: @tag.errors, status: :unprocessable_entity
        end
      end

      def update
        if @tag.update(tag_params)
          render :show, status: :ok, location: @tag
        else
          render json: @tag.errors, status: :unprocessable_entity
        end
      end

      private
      def set_tag
        @tag = Tag.find(params[:id])
      end

      def tag_params
        params.require(:tag).permit(:title, :post_id)
      end

    end
  end
end 