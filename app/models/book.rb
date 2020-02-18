class Book < ApplicationRecord
  belongs_to :users
  has_many :libraries
  has_many :books
  validates :title, presence: true
end
