class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email]) # [28] This line sets a local variable called
  	# user.  The right side of the = sign takes a user's inputted (on the page) email address (via the params method)
  	# and finds the user in the User table by their email address.

  	if user != nil && user.authenticate(params[:password]) # [29] If the variable we set (called 'user') does not equal nil (have nothing in it)
  		# and the variable has an authenticated password that was just input
  		session[:user_id] = user.id # [30] then set a browser cookie named the user's id (i.e. it could be id of 7, so cookie name would be 7)
  		# Its set by taking the id of the variable user (which has been set to an actual person's account) and setting it to the cookie name.
  		redirect_to users_url # [31] and redirect us back to the index page, which is represented by users_url
  	else # [32] If the 'if' statement doesn't have both conditions met, then we want to
  		redirect_to new_session_url # [33] redirect the user to the login page (new_session_url)
  	end # [34] This ends our logic loop
  end

  def destroy
  	session[:user_id] = nil # [35] This sets the cookie to nil.  Once a cookie is nil, they wouldn't be logged in anymore because there is no user id!
  	redirect_to new_session_url # [36] Since they're no longer logged in, they will be sent back to the login page
  	# [37] Now lets head to: your_app_name/app/views/sessions/new.html.erb
  end
end
