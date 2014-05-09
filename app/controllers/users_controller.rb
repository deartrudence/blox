class UsersController < ApplicationController
  # before_action :set_user


  def edit
  	@otheruser = User.find(params[:id])
  end

  def update

    @otheruser = User.find(params[:id])

  	respond_to do |format|
      if @otheruser.update(user_params)
        format.html { redirect_to dashboard_show_path, notice: "User was successfully updated."}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @otheruser.errors, status: :unprocessable_entity }
      end
    end


  end

  def destroy
  	User.find(params[:id]).destroy
  	redirect_to dashboard_show_path
  end


    # def set_user
    #   @otheruser = User.find(params[:id])
    # end

    def user_params
      params.require(:user).permit(:email, :encrypted_password, :role)
    end


end
