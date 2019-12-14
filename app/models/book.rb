class Book < ApplicationRecord
  has_many :users
  has_many :libraries
  has_many :books
  validates :title, presence: true
end
