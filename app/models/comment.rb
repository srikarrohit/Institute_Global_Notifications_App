class Comment < ActiveRecord::Base
	belongs_to :post
	belongs_to :user
	validates :content, presence: true 
	#can use 'content' as well as argument to vaidates and presence doesn't require curly braces as it's the last argument for the method
end
