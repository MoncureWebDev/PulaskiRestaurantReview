class Review < ActiveRecord::Base
	#We have 2 databases, and need to link the two so that reviews belong to a user
	belongs_to :user
	# Now we need to add that each user has many reviews in our user.rb file!


	belongs_to :restaurant






	# Models handle Data-related tasks.  We need to validate that each of the fields is filled in



	validates :rating, :comment, presence: true
	validates :rating, numericality: {
		only_integer: true,
		greater_than_or_equal_to: 1,
		less_than_or_equal_to: 10,
		message: "should be a star rating between 1 and 10"
	}	
end
