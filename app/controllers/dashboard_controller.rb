class DashboardController < ApplicationController

	before_filter :authorize_admin

  def show
  	@blocs = Bloc.all
  	@categories = Category.all
  	@webpages = Webpage.count
    @whichstuff = params[:whichstuff]
    if params[:search]
      @users = User.paginate(:page => params[:page], :per_page => 25).search(params[:search])
    else
      @users = User.paginate(:page => params[:page], :per_page => 25)
    end 
  end

  def show_user_list 
      @users = User.paginate(:page => params[:page], :per_page => 3) #.sort_by(&:created_at)
  end

end
