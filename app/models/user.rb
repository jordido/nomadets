class User < ActiveRecord::Base
	TYPES = ["Teacher","Venue","Student"]
	has_secure_password

	validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i } 
	validates_presence_of :password_digest
	belongs_to :category
	has_many :reviews
	has_many :courses
end
