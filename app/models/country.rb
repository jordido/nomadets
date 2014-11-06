class Country < ActiveRecord::Base
	has_many :regions
	has_many :cities
	has_many :users, class_name: "User", foreign_key: "user_id"
	def flag
		"flag-"+self.iso2.downcase
	end
end
