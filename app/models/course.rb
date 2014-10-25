class Course < ActiveRecord::Base	
	
	belongs_to venue
	belongs_to teacher
	has_many students
	has_many reviews
end
