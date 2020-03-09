class Book < ApplicationRecord
  has_many :book_libraries, dependent: :destroy
  has_many :libraries, through: :book_libraries
  has_many :posts
  accepts_nested_attributes_for :book_libraries, allow_destroy: true
  validates :title, presence: true
end
