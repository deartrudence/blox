class WebLayoutsController < ApplicationController
  before_action :set_web_layout, only: [:show, :edit, :update, :destroy]

  def sort
    params[:all_layouts].each_with_index do |id, index|
      WebLayout.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
    # params[:scenes].each_with_index do |id, index|
    # Scene.update_all(['position=?', index+1], ['id=?', id])
    # end
    # render :nothing => true
  end

  # GET /web_layouts
  # GET /web_layouts.json
  def index
    @web_layouts = WebLayout.all
  end

  # GET /web_layouts/1
  # GET /web_layouts/1.json
  def show

  end

  # GET /web_layouts/new
  def new
    @web_layout = WebLayout.new
  end

  # GET /web_layouts/1/edit
  def edit
  end

  # POST /web_layouts
  # POST /web_layouts.json
  def create
      #This create adds a new WebLayout to a Webpage

      @web_layout = WebLayout.new 
      
      @web = Webpage.find(params[:webpage])

      #Increment WebLayout position or add the first one
      if @web.web_layouts.present?
        new_index = @web.web_layouts.maximum(:position) + 1
      else
        new_index = 1
      end
      #set bloc for WebLayout
      @b = Bloc.find(params[:bloc])

      #Set and save WebLayout
      @web_layout.webpage = @web
      @web_layout.bloc = @b
      @web_layout.position = new_index
      @web_layout.save
    
    #Redirect to Webpage Edit page
    respond_to do |format|
      #if @web_layout.save
         format.html { redirect_to edit_webpage_path(@web), notice: 'Web layout was successfully created.' }
         #format.json { render action: 'show', status: :created, location: @web_layout }
      # else
      #   format.html { render action: 'new' }
      #   format.json { render json: @web_layout.errors, status: :unprocessable_entity }
      # end
    end
  end

  # PATCH/PUT /web_layouts/1
  # PATCH/PUT /web_layouts/1.json
  def update

    respond_to do |format|
      if @web_layout.update(web_layout_params)
        format.html { redirect_to @web_layout, notice: 'Web layout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @web_layout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_layouts/1
  # DELETE /web_layouts/1.json
  def destroy
    @web_layout.destroy
    respond_to do |format|
      format.html { redirect_to edit_webpage_path(params[:webpage]) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web_layout
      @web_layout = WebLayout.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def web_layout_params
      params.require(:web_layout).permit(:bloc_id, :webpage_id, :position)
    end
end
