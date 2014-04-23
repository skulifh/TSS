class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
  	@user = User.new
  	@user.username = params[:user][:username]
  	@user.password = params[:user][:password]
  	@user.email = params[:user][:email]
    @user.admin = false

    if @user.save
      sign_in @user
      redirect_to root_path
    else
      render 'new'
    end

  	#@user.save!
  	#redirect_to users_path()
  end

  private

  def user_params
  	params.require(:user).permit(:username, :password, :email, :admin)
  end
end
