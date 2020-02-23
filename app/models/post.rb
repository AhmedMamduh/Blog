class Post < ApplicationRecord
  #------------------------------ Associations --------------------------------
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :tags, dependent: :destroy
  #-------------------------------- Callbacks ---------------------------------
  after_commit :delete_post, on: :create
  #--------------------------------- Methods ---------------------------------
  def user_is_author?(current_user_id)
    current_user_id == user_id
  end

  def delete_post
    DeletePost.perform_in(24.hours, id)
  end

end
