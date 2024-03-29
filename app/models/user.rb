class User < ApplicationRecord
  #-------------------------------- Plugins -----------------------------------
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_base64_uploader :image, ImageUploader
  #------------------------------ Associations --------------------------------
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

end
