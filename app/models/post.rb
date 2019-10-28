class Post < ApplicationRecord
	
	has_many :comments, dependent: :destroy
#Search Database code
	def self.search(search)
		where("name LIKE ?", "%#{search}%") 
		where("content LIKE ?", "%#{search}%")
	  end
end
