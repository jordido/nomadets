class UsersController < ApplicationController

	rescue_from Pundit::NotAuthorizedError, with: :deny_access

  include Pundit

	before_action :load_user, except: [:index, :new]

  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def show
#  	 authorize @user
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
#  	 authorize @user
  end

  def update
  	 authorize @user
  end
  
  private

  def user_params
  	params.require(:user).permit(:name, :last_name, :password_digest, :password_confirm, :email, :address, :type)
  end

  def load_user
    @user = User.find(params[:id])
  end
end
