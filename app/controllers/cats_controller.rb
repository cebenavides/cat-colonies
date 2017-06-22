class CatsController < ApplicationController
  before_action :auth_user
  before_action :set_cat, only: [:show, :edit, :update, :destroy]

  # GET /cats
  # GET /cats.json
  def index
    @cats = Colony.find(params[:colony_id]).cats
  end

  # GET /cats/1
  # GET /cats/1.json
  def show
    @events = @cat.events
  end

  # GET /cats/new
  def new
    @colony = Colony.find(params[:colony_id])
    @cat = @colony.cats.build
  end

  # GET /cats/1/edit
  def edit
    @colony = Colony.find(params[:colony_id])
  end

  # POST /cats
  # POST /cats.json
  def create
    @colony = Colony.find(params[:colony_id])
    @cat = @colony.cats.build(cat_params)
    
    respond_to do |format|
      if @cat.save
        format.html { redirect_to colony_path(@colony), notice: 'Cat was successfully created.' }
        format.json { render :show, status: :created, location: @cat }
      else
        format.html { render :action => "new" }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cats/1
  # PATCH/PUT /cats/1.json
  def update
    @colony = Colony.find(params[:colony_id])
    respond_to do |format|
      if @cat.update(cat_params)
        format.html { redirect_to colony_path(@colony), notice: 'Cat was successfully updated.' }
        format.json { render :show, status: :ok, location: @cat }
      else
        format.html { render :action => "edit" }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cats/1
  # DELETE /cats/1.json
  def destroy
    colony = @cat.colony
    @cat.destroy
    respond_to do |format|
      format.html { redirect_to colony_path(colony), notice: 'Cat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat
      @cat = Cat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cat_params
      params.require(:cat).permit(:code, :name, :birthday, :colony_id, :image, :personality, :sex, :age)
    end
    
    def auth_user
      redirect_to root_path unless current_user
    end
end
