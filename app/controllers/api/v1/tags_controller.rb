module Api
  module V1
    class TagsController < ApplicationController
      before_action :authenticate_request!
      before_action :set_post, only: [:create, :update]
      before_action :set_tag, only: :update

      def create
        return if @post.nil?
        tag = @post.tags.create(tag_params)
        if tag.save
          render 'api/v1/posts/show', status: :created
        else
          render json: tag.errors, status: :unprocessable_entity
        end
      end

      def update
        return unless @post.user_is_author?(current_user.id)
        if @tag.update(tag_params)
          render 'api/v1/posts/show', status: :ok
        else
          render json: @tag.errors, status: :unprocessable_entity
        end
      end

      private
      def set_post
        @post = Post.find(params[:post_id])
      end

      def set_tag
        @tag = Tag.find(params[:id])
      end

      def tag_params
        params.require(:post).permit(:title)
      end

    end
  end
end 