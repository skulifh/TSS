class SessionsController < ApplicationController
	def new
	end

	def create
			user = User.find_by(username: params[:session][:username])
		    if user && user.password == params[:session][:password]
		     	sign_in user
        		redirect_to users_path()
		    else
		      flash.now[:error] = 'Invalid email/password combination'
		      render 'new'
		    end
	end

	#def destroy
	#end

	# def sign_in(user)
	#     remember_token = User.new_remember_token
	#     cookies.permanent[:remember_token] = remember_token
	#     user.update_attribute(:remember_token, User.hash(remember_token))
	#     self.current_user = user
 #  	end

 #  def signed_in?
 #    !current_user.nil?
 #  end
  
 #  def destroy
 #    sign_out
 #    redirect_to root_url
 #  end

 #  def current_user=(user)
 #    @current_user = user
 #  end

 #  def current_user
 #    remember_token = User.hash(cookies[:remember_token])
 #    @current_user ||= User.find_by(remember_token: remember_token)
 #  end
end
