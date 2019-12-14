class Post < ApplicationRecord
  has_many :users
  has_many :books
  validates :title, presence: true
  validates :user_id, presence: true
  validates :book_id, presence: true
end
