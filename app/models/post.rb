class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum: 10, maximum: 140}
  validates :body, presence: true, length: {minimum: 300}
  validates :category, presence: true
  has_many :comments, dependent: :destroy
  belongs_to :category
  belongs_to :user
end
