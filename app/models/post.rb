# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string(255)
#  content    :text(65535)
#  user_id    :integer
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :title, presence: true
  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
