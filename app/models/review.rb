class Review < ActiveRecord::Base
	#We have 2 databases, and need to link the two so that reviews belong to a user
	belongs_to :user
	# Now we need to add that each user has many reviews in our user.rb file!


	belongs_to :restaurant
end
