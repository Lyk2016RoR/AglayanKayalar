class Author < ApplicationRecord
	has_many :books
	has_many :acomments
	
end
