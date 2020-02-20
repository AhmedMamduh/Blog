class User < ApplicationRecord
  #-------------------------------- Plugins -----------------------------------
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
