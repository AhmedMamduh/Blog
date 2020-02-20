module Api
  module V1
    class CommentsController < ApplicationController
      before_action :authenticate_request!
      before_action :set_comment, only: [:show, :update, :destroy]

      def index
        @comments = Comment.all
      end

      def show
      end

      def create
        @comment = Comment.new(comment_params)

        if @comment.save
          render :show, status: :created, location: @comment
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      def update
        if @comment.update(comment_params)
          render :show, status: :ok, location: @comment
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @comment.destroy
      end

      private
      def set_comment
        @comment = Comment.find(params[:id])
      end

      def comment_params
        params.require(:comment).permit(:body, :user_id, :post_id)
      end

    end
  end
end
    