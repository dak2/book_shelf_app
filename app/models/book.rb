class Book < ApplicationRecord
  has_many :users
  has_many :libraries
  validates :title, presence: true
end
