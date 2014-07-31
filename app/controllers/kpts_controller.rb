class KptsController < ApplicationController
  before_action :set_kpt, only: [:show, :edit, :update, :destroy]

  # GET /kpts
  # GET /kpts.json
  def index
    @kpts = Kpt.all
  end

  # GET /kpts/1
  # GET /kpts/1.json
  def show
  end

  def new
    @kpt = Kpt.new
    3.times do
      @kpt.keeps.build
      @kpt.problems.build
      @kpt.tries.build
    end
  end

  # GET /kpts/1/edit
  def edit
  end

  # POST /kpts
  # POST /kpts.json
  def create
    @kpt = Kpt.new(kpt_params)

    respond_to do |format|
      if @kpt.save
        format.html { redirect_to kpts_path, notice: 'Kpt was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @kpt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kpts/1
  # PATCH/PUT /kpts/1.json
  def update
    respond_to do |format|
      if @kpt.update(kpt_params)
        format.html { redirect_to kpts_path, notice: 'Kpt was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @kpt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kpts/1
  # DELETE /kpts/1.json
  def destroy
    @kpt.destroy
    respond_to do |format|
      format.html { redirect_to kpts_url, notice: 'Kpt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kpt
      @kpt = Kpt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kpt_params
      params.require(:kpt).permit(:title, keeps_attributes: [:id, :content], problems_attributes: [:id, :content], tries_attributes: [:id, :content])
    end
end
