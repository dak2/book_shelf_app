# == Schema Information
#
# Table name: books
#
#  id             :bigint           not null, primary key
#  title          :text(65535)      not null
#  image_links    :string(255)
#  description    :text(65535)
#  publisher      :string(255)
#  published_date :string(255)
#  library_id     :integer
#  post_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Book < ApplicationRecord
  has_many :book_libraries, dependent: :destroy
  has_many :libraries, through: :book_libraries
  has_many :posts
  accepts_nested_attributes_for :book_libraries, allow_destroy: true
  validates :title, presence: true
end
