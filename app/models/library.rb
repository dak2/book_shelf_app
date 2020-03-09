class Library < ApplicationRecord
  has_many :book_libraries, dependent: :destroy
  has_many :books, through: :book_libraries
  accepts_nested_attributes_for :book_libraries, allow_destroy: true
  validates :name, presence: true
  validates :book_id, presence: true
end
