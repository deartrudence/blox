class BlocsController < ApplicationController
  before_action :set_bloc, only: [:show, :edit, :update, :destroy, :preview]
  # before_filter :authorize_admin

  # GET /blocs
  # GET /blocs.json
  def index
    @users = User.all
    @order = params[:order]
    if @order == 'liked'
      @blocs = Bloc.all.order('likes.count')
    else
      @blocs = Bloc.all.sort_by(&:created_at)
    end
    if params[:search]
      @blocs = Bloc.tagged_with(params[:search], :any => :true)
    else
      @blocs = Bloc.includes(:category).all
    end
  end

  # GET /blocs/1
  # GET /blocs/1.json
  def show
  end

  def preview

  end

  # GET /blocs/new
  def new
    @bloc = Bloc.new
  end

  # GET /blocs/1/edit
  def edit
    if user_owns_bloc? or current_user.role == 'admin'
    else 
      redirect_to bloc_path(params[:id])
    end
  end

  def crop

  end

  def crop_submit
    redirect_to bloc_show_path(params[:id]), notice: 'Bloc was successfully created.'
  end

  # POST /blocs
  # POST /blocs.json
  def create
    @bloc = Bloc.new(bloc_params)
    @bloc.user_id = params[:user_id]

    # respond_to do |format|
      if @bloc.save
        if params[:bloc][:bloc_img].blank?
          redirect_to @bloc
        else
          render action: "crop"
        end
        # format.html { redirect_to dashboard_show_path, notice: 'Bloc was successfully created.' }
        # format.json { render action: 'show', status: :created, location: @bloc }
      else
        render action: "new"
        # format.html { render action: 'new' }
        # format.json { render json: @bloc.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /blocs/1
  # PATCH/PUT /blocs/1.json
  def update
    respond_to do |format|
      if @bloc.update(bloc_params)
        format.html { redirect_to dashboard_show_path, notice: 'Bloc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bloc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blocs/1
  # DELETE /blocs/1.json
  def destroy
    @bloc.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_show_path }
      format.json { head :no_content }
    end
  end

  def tagged
    @users = User.all
    if params[:tag].present?
      @blocs = Bloc.tagged_with(params[:tag])
    else
      @blocs = Bloc.all
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bloc
      @bloc = Bloc.find(params[:id])
    end

    def user_owns_bloc?
      @bloc.user == current_user
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def bloc_params
      params.require(:bloc).permit(:name, :code, :styles, :bloc_img, :category_id, :user_id, :tag_list, :crop_x, :crop_y, :crop_w, :crop_h)
    end
end
