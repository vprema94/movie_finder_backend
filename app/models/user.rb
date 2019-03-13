class User < ApplicationRecord
   has_many :favorites
   has_many :movies, through: :favorites
   has_secure_password
   validates :username, uniqueness: { case_sensitive: false }, presence: true
   validates :password, presence: true
end
