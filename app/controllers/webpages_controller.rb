class WebpagesController < ApplicationController
  before_action :set_webpage, only: [:show, :edit, :update, :destroy]
  newrelic_ignore :only => [:show]

  # GET /webpages
  # GET /webpages.json
  def index
    #@webpages = Webpage.all
    @webpages = current_user.webpages.all
    
  end

  # GET /webpages/1
  # GET /webpages/1.json
  def show
  end

  # GET /webpages/new
  def new
    @webpage = Webpage.new
    @categories = Category.all
  end

  # GET /webpages/1/edit
  def edit
    @categories = Category.all
  end

  # POST /webpages
  # POST /webpages.json
  def create
    #@webpage = Webpage.new(webpage_params)
    @webpage = current_user.webpages.build(webpage_params)

    respond_to do |format|
      if @webpage.save
        format.html { redirect_to edit_webpage_path(@webpage), notice: 'Webpage was successfully created.' }
        format.json { render action: 'show', status: :created, location: @webpage }
      else
        format.html { render action: 'new' }
        format.json { render json: @webpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /webpages/1
  # PATCH/PUT /webpages/1.json
  def update

      respond_to do |format|
        if @webpage.update(webpage_params)
          format.html { redirect_to edit_webpage_path, notice: 'Webpage was successfully updated.' }
          #format.html { redirect_to edit_webpage_path, notice: 'Webpage was successfully updated.' }
          #format.json { head :no_content }
          format.json { render json: @webpage}
        else
          format.html { render action: 'edit' }
          format.json { render json: @webpage.errors, status: :unprocessable_entity }
        end
      #end
    end

    
  end

  # DELETE /webpages/1
  # DELETE /webpages/1.json
  def destroy
    @webpage.destroy
    respond_to do |format|
      format.html { redirect_to webpages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webpage
      @webpage = Webpage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def webpage_params
      params.require(:webpage).permit(:name, :bloc_id, :user_id)
    end
end
