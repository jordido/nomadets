class User < ActiveRecord::Base
	TYPES = ["Teacher","Venue","Student"]
	has_secure_password
	validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i } 
	scope :visible, -> { where(visible: true) }
  scope :hidden,  -> { where(visble: false) }

	belongs_to :category
	has_many :reviews
	has_many :courses
end
