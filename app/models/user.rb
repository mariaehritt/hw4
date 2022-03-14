class User < ApplicationRecord
  has_many :posts
  has_many :places
end
