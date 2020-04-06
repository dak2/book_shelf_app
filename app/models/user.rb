# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  post_id         :integer
#  posted_status   :boolean
#  password_digest :string(255)
#
class User < ApplicationRecord
  has_many :books
  has_many :posts, dependent: :destroy
  has_secure_password

  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  enum posted_status: { 
    has_posted: 0,
    has_not_posted: 1
  }
end
