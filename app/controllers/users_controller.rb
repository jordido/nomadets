class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def show
  end

	def create
		## Creating new instance user with params from browser
		@user = User.new(user_params)

		## Check if user is saved to DB (it passes validations)
		if @user.save
			redirect_to users_url
		else
			## display the "new.html.erb" template with the @user variable
 			render :new
		end
	end

  def edit
  end

  def user_params
  	params.require(:user).permit(:name, :last_name, :password_digest, :password_confirm, :email, :address, :type)
  end
end
