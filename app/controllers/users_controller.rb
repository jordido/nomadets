class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def teachers
    @users = Teacher.all
    render :index
  end

  def venues
    @users = Venue.all
    render :index
  end

  def students
    @users = Student.all
    render :index
  end

  def new
  	@user = User.new
  end

  def show
  end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to users_url
		else
 			render :new
		end
	end

  def edit
  end

  private

  def user_params
  	params.require(:user).permit(:name, :last_name, :password_digest, :password_confirm, :email, :address, :type)
  end

end
