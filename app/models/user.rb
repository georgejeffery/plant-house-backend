class User < ApplicationRecord
  has_many :rooms
  has_secure_password
end
