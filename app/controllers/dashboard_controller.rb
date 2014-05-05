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
  	@users = User.all
  end

end
