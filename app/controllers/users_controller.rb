class UsersController < ApplicationController

	before_action :set_user, only: [:edit, :update]

  def edit 
  	@users = User.all
  end

  def update
    if @user.update(user_params)
       flash[:notice] = "User profile successfully updated"
       redirect_to @user
     else
       flash[:notice] = "Oops something went wrong. Please try again."
       render :edit 
     end
  end

  def index
  	@users = User.all
  end

  def show 
    @user = User.find(params[:id])
 end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation) 
  end

  def set_user
    @user = current_user
  end


end

