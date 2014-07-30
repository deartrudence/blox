class BucketBlocsController < ApplicationController
  before_action :set_bucket_bloc, only: [:show, :edit, :update, :destroy]

  # GET /bucket_blocs
  # GET /bucket_blocs.json
  def index
    @bucket_blocs = BucketBloc.all
  end

  # GET /bucket_blocs/1
  # GET /bucket_blocs/1.json
  def show
  end

  # GET /bucket_blocs/new
  def new
    @bucket_bloc = BucketBloc.new
  end

  # GET /bucket_blocs/1/edit
  def edit
  end

  # POST /bucket_blocs
  # POST /bucket_blocs.json
  def create
    @bucket_bloc = BucketBloc.new

    @user = User.find(params[:user])
    @bloc = Bloc.find(params[:bloc])

    @bucket_bloc.user = @user
    @bucket_bloc.bloc = @bloc

    if @bucket_bloc.save
      # @bloc = Bloc.find(@like.likeable_id)
      render :add_to_bucket, locals: {bloc: @bloc, user: @user}
    end

    # respond_to do |format|
    #   #if @bucket_bloc.save
    #     # format.html { redirect_to blocs_path, notice: 'Bucket bloc was successfully created.' }
    #     #format.json { render action: 'show', status: :created, location: @bucket_bloc }
    #   # else
    #   #   format.html { render action: 'new' }
    #   #   format.json { render json: @bucket_bloc.errors, status: :unprocessable_entity }
    #   # end
    # end
  end

  # PATCH/PUT /bucket_blocs/1
  # PATCH/PUT /bucket_blocs/1.json
  def update
    respond_to do |format|
      if @bucket_bloc.update(bucket_bloc_params)
        format.html { redirect_to @bucket_bloc, notice: 'Bucket bloc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bucket_bloc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bucket_blocs/1
  # DELETE /bucket_blocs/1.json
  def destroy
    @bloc = Bloc.find(params[:id])
    # @user = User.find_by(user_id: current_user)
    @bucket_bloc = current_user.bucket_blocs.find_by(bloc_id: @bloc.id)
    
    if @bucket_bloc.destroy
      render :add_to_bucket, locals: {bloc: @bloc}
    end
    # respond_to do |format|
    #   format.html { redirect_to bucket_blocs_url }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bucket_bloc
      @bucket_bloc = BucketBloc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bucket_bloc_params
      params.require(:bucket_bloc).permit(:user_id, :bloc_id, :bloc)
    end
end
