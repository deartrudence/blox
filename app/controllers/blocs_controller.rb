class BlocsController < ApplicationController
  before_action :set_bloc, only: [:show, :edit, :update, :destroy]

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
  end

  # POST /blocs
  # POST /blocs.json
  def create
    @bloc = Bloc.new(bloc_params)

    respond_to do |format|
      if @bloc.save
        format.html { redirect_to dashboard_index_path, notice: 'Bloc was successfully created.' }
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
        format.html { redirect_to dashboard_index_path, notice: 'Bloc was successfully updated.' }
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
      format.html { redirect_to dashboard_index_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bloc
      @bloc = Bloc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bloc_params
      params.require(:bloc).permit(:name, :code, :img_url, :category_id)
    end
end
