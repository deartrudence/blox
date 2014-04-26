class WebLayoutsController < ApplicationController
  before_action :set_web_layout, only: [:show, :edit, :update, :destroy]

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
      #@web_layout = WebLayout.new(position: 1) #(web_layout_params)
      #new_index = @web_layout.position + 1
      #@bloc = params[:bloc]
      @web_layout = WebLayout.new #webpage: @webpage, bloc: @bloc,  position: 1
      #raise "hell"
      @web = Webpage.find_by(@webpage)
      @b = Bloc.find(params[:bloc])
      @web_layout.webpage = @web
      @web_layout.bloc = @b
      @web_layout.save
    
    #@web_layout = WebLayout.new(web_layout_params)

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
      format.html { redirect_to web_layouts_url }
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
