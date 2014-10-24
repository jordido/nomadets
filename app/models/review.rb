class Review < ActiveRecord::Base
	belongs_to :user
	has_many :users
	validates_presence_of :rating
end