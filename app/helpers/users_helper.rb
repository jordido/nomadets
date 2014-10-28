module UsersHelper
	def reviewed_by(user)
		 Review.find_by_author_id(user).comment if Review.find_by_author_id(user)
	end

	def reviewed(user)
	end

end
