class Country < ActiveRecord::Base
	has_many :regions
	has_many :cities
	has_many :users, class_name: "User", foreign_key: "user_id"
end
