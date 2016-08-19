class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookcomments
  has_many :authorcomments
  has_many :wishlists
  has_many :wishes, through: :wishlists, source: :book
end
