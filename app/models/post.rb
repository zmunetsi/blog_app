class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum: 20, maximum: 140}
  validates :body, presence: true, length: {minimum: 300}
  has_many :comments, dependent: :destroy
  belongs_to :user
end
