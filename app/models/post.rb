class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	
	#Search Database 
	def self.search(search)
		where("title LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%") 
	  end
end
