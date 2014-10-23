require 'rails_helper'

RSpec.describe User, :type => :model do
	before (:each) do
		@u = User.new
		@u.email = "qegeg@aqg.co"
		@u.password_digest = "1234"
	end
	describe "email validation :" do
	  it 'presence of email' do  	
	  	@u.email = ""
	  	(expect @u.valid?).to be false
	  end
	  it 'format of valid email' do
	  	@u.email = "qegeg@aqg.co"
	  	(expect @u.valid?).to be true
	  end
	    it 'format of invalid email' do
	  	@u.email = "qegegaqg.com"
	  	(expect @u.valid?).to be false
	  end
	end
	describe "password validation :" do
		it 'presence of password' do
			@u.password_digest = ""
			(expect @u.valid?).to be false
		end
	end
end

