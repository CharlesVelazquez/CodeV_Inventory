class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :admin_user, only: :destroy#Wanted to keep attackers from deleting users from the cmd lines

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #@user.send_activation_email
      log_in @user
      flash[:info] = 'Account created successfuly' #"Please check your email to activate your account."
      redirect_to current_user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to root_url
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end


private
  def user_params
  	params.fetch(user:, {}).permit(:name, :email, :password, :password_confirmation)
  end

end