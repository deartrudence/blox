class UsersController < ApplicationController
  def edit
  	@user = User.find_by(params[:thisuser])
  end

  def update
  	#TODO
  end

  def destroy
  	User.find_by(@user).destroy
  	#redirect_to edit_webpage_path(@webpage)
    redirect_to dashboard_show_path
  end
end
