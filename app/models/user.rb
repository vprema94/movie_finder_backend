class User < ApplicationRecord
   has_many :favorites
   has_many :movies, through: :favorites
   has_secure_password
end
