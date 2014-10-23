require 'rails_helper'

RSpec.describe User, :type => :model do
	before (:each) do
		@u = FactoryGirl.create(:user, :email => "foo@bar.com")    
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
	  it 'email is unique' do
	    @u2 = FactoryGirl.create(:user)
	    @u2.email = "foo@bar.com"
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

