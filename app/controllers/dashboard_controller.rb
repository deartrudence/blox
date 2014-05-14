class DashboardController < ApplicationController

	before_filter :authorize_admin

  def show
  	@blocs = Bloc.all
  	@categories = Category.all
  	@webpages = Webpage.count
    @whichstuff = params[:whichstuff]
    if params[:search]
      @users = User.search(params[:search])
    else
      @users = User.all
    end 
  end

  def show_user_list 
      @users = User.all
  end

end
