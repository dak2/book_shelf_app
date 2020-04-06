# == Schema Information
#
# Table name: libraries
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  content    :text(65535)
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Library < ApplicationRecord
  has_many :book_libraries, dependent: :destroy
  has_many :books, through: :book_libraries
  accepts_nested_attributes_for :book_libraries, allow_destroy: true
  validates :name, presence: true
  validates :book_id, presence: true
end
