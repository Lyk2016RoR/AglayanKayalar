class Acomment < ApplicationRecord
  belongs_to :user
  belongs_to :author
end
