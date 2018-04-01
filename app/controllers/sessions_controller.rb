class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # if user.activated?
        # Log the user in and redirect to the user's show page.
        log_in user
        #if statement for the ckeckbox, remembers them
        # params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else#Needed to use flash.now to prevent message from persisting after render
        flash.now[:danger] = 'Invalid email/password combination'
        # message  = "Account not activated. "
        # message += "Check your email for the activation link."
        # flash[:warning] = message
        redirect_to root_url
      end
    end
  end


  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end