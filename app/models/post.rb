class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum: 50, maximum: 140}
  validates :body, presence: true, length: {minimum: 500}
  has_many :comments
end
