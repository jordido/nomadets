class User < ActiveRecord::Base
	TYPES = ["Teacher","Venue","Student"]
	has_secure_password

	has_many :reviews
	has_many :reviews_by, class_name: "Review", foreign_key: "author_id"
	has_many :reviews_to, class_name: "Review", foreign_key: "reviewed_id"
	has_many :courses, class_name: "Course", foreign_key: "courses_id"

	validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i } 

	belongs_to :category

end
