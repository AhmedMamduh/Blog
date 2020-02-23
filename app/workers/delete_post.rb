class DeletePost
  include Sidekiq::Worker
  def perform(post_id)
    post = Post.find(post_id)
    post.delete
  end
end
