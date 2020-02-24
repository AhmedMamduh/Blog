class Post < ApplicationRecord
  #------------------------------ Associations --------------------------------
  belongs_to :author, class_name: 'User', foreign_key: "user_id"
  has_many :comments, dependent: :destroy
  has_many :tags, dependent: :destroy
  accepts_nested_attributes_for :tags
  #------------------------------- Validations --------------------------------
  validate :must_have_at_least_one_tag
  #-------------------------------- Callbacks ---------------------------------
  after_commit :delete_post, on: :create
  #--------------------------------- Methods ---------------------------------
  def user_is_author?(current_user_id)
    current_user_id == user_id
  end

  def delete_post
    DeletePost.perform_in(24.hours, id)
  end

  private

  def must_have_at_least_one_tag
    errors.add(:post, 'must have at least one tag') if tags.empty?
  end

end
