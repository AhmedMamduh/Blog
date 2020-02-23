class Comment < ApplicationRecord
  #------------------------------ Associations --------------------------------
  belongs_to :user
  belongs_to :post
  #--------------------------------- Methods ---------------------------------
  def user_is_author?(current_user_id)
    current_user_id == user_id
  end

end
