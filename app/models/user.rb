class User < ActiveRecord::Base
	mount_uploader :picture, UserPictureUploader
	TYPES = ["Teacher","Venue","Student"]
	has_secure_password

	has_many :reviews
	has_many :reviews_by, class_name: "Review", foreign_key: "author_id"
	has_many :reviews_to, class_name: "Review", foreign_key: "reviewed_id"
	has_many :courses, class_name: "Course", foreign_key: "courses_id"

	validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i } 

	has_and_belongs_to_many :categories
end
