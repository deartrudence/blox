class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update]

  # GET /likes
  # GET /likes.json
  def index
    @likes = Like.all
  end

  # GET /likes/1
  # GET /likes/1.json
  def show
  end

  # GET /likes/new
  def new
    @like = Like.new
  end

  # GET /likes/1/edit
  def edit
  end

  # POST /likes
  # POST /likes.json
  def create
    @likeable = find_likeable
      @user = current_user
      @like = @user.likes.build(likeable: @likeable)
    #@like = Like.new(like_params)
      if @like.save
        redirect_to @likeable, notice: "liked!"
      else
        redirect_to @likeable, notice: "Not liked"
      end

    # respond_to do |format|
    #   if @like.save
    #     format.html { redirect_to @like, notice: 'Like was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @like }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @like.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /likes/1
  # PATCH/PUT /likes/1.json
  def update
    respond_to do |format|
      if @like.update(like_params)
        format.html { redirect_to @like, notice: 'Like was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    #@like_id = params[:id]
    #@like_array = @like_id.pluck(:id)
    #@like_record = Like.where(:likeable_id => @bloc, :user_id => current_user.id)
    #@like_array = @like_record.pluck(:id)
    #@like_id = @like_array[0]
    @bloc = Bloc.find(params[:bloc_id])
    @like = @bloc.likes.find_by(user_id: current_user)
    @like.destroy
    respond_to do |format|
      format.html { redirect_to bloc_path(@bloc) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.require(:like).permit(:likeable, :likeable_type, :user)
    end

    def find_likeable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end

    
end
