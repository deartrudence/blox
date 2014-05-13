class DashboardController < ApplicationController

	before_filter :admin

  def show
  	@blocs = Bloc.all
  	@categories = Category.all
  	@webpages = Webpage.count
  	@users = User.all
    @whichstuff = params[:whichstuff]
  end

  def show_user_list
    @whichstuff = params[:whichstuff] 
    if params[:search]
      @users = User.search(params[:search])
    else
      @users = User.all
    end
    #redirect_to dashboard_show_path(:whichstuff => "userlist")
  end

end
