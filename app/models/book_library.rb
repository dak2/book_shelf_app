# == Schema Information
#
# Table name: book_libraries
#
#  id         :bigint           not null, primary key
#  book_id    :bigint           not null
#  library_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class BookLibrary < ApplicationRecord
  belongs_to :book
  belongs_to :library
end
