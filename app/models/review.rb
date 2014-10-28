class Review < ActiveRecord::Base
	belongs_to :author, class_name: "User", foreign_key: "author_id"
	belongs_to :reviewed, class_name: "User", foreign_key: "reviewed_id"
	belongs_to :course
	validates_presence_of :rating, :author_id
	validates :rating, :inclusion => 0..5
end