class Review < ActiveRecord::Base
	belongs_to :creator, class_name: "User", foreign_key: "creator_id"
	belongs_to :referred, class_name: "User", foreign_key: "referred_id"
	belongs_to :course
	validates_presence_of :rating, :creator_id
end