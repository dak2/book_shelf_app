class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books
  has_many :posts, dependent: :destroy


  enum posted_status: { 
    has_posted: 0,
    has_not_posted: 1
  }
end
