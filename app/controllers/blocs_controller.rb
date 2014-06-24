class BlocsController < ApplicationController
  before_action :set_bloc, only: [:show, :edit, :update, :destroy]
  # before_filter :authorize_admin

  # GET /blocs
  # GET /blocs.json
  def index
    @blocs = Bloc.includes(:category).all
  end

  # GET /blocs/1
  # GET /blocs/1.json
  def show
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

  # POST /blocs
  # POST /blocs.json
  def create
    @bloc = Bloc.new(bloc_params)
    @bloc.user_id = params[:user_id]

    respond_to do |format|
      if @bloc.save
        format.html { redirect_to dashboard_show_path, notice: 'Bloc was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bloc }
      else
        format.html { render action: 'new' }
        format.json { render json: @bloc.errors, status: :unprocessable_entity }
      end
    end
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
      params.require(:bloc).permit(:name, :code, :bloc_img, :category_id, :user_id)
    end
end
