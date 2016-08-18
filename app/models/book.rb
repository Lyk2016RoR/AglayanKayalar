class Book < ApplicationRecord
  belongs_to :category
  belongs_to :author
  belongs_to :publisher
  belongs_to :interpreter

  has_many :bookcomments
end
