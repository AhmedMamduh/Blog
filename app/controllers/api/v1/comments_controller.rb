module Api
  module V1
    class CommentsController < ApplicationController
      before_action :authenticate_request!
      before_action :set_post, only: [:create]
      before_action :set_comment, only: [:update, :destroy]

      def create
        return if @post.nil?
        comment = @post.comments.create(body: comment_params[:body], user_id: current_user.id)
        if comment.save
          render 'api/v1/posts/_post', locals: { post: @post }, status: :created
        else
          render json: comment.errors, status: :unprocessable_entity
        end
      end

      def update
        return unless @comment.user_is_author?(current_user.id)
        if @comment.update(comment_params)
          render 'api/v1/posts/_post', locals: { post: @comment.post }, status: :ok
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      def destroy
        return unless @comment.user_is_author?(current_user.id)
        @comment.destroy
      end

      private
      def set_post
        @post = Post.find(params[:post_id].to_i)
      end

      def set_comment
        @comment = Comment.find(params[:id])
      end

      def comment_params
        params.require(:comment).permit(:body)
      end

    end
  end
end
    