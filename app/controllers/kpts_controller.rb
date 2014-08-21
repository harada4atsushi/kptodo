class KptsController < ApplicationController
  before_action :set_kpt, only: [:show, :edit, :update, :destroy]

  def index
    @kpts = current_user.kpts 
  end

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

  def create
    @kpt = current_user.kpts.build(kpt_params)
    if @kpt.save
      redirect_to kpts_path, notice: '登録しました'
    else
      render :new
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

  def export
    # TODO 共通化
    token = current_user.preference.todoist_api_token
    if token
      Todoist::Base.setup(token)
      project = Todoist::Project.all[0].add_task(try_params[:content], { "priority" => 1, "date_string" => "tomorrow" })
    end
  end

  #def redmine
  #  Redmine.new(redmine_params).export
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kpt
      @kpt = Kpt.find(params[:id])
    end

    def kpt_params
      params.require(:kpt).permit(:title, keeps_attributes: [:id, :content], problems_attributes: [:id, :content], tries_attributes: [:id, :content])
    end

    def try_params
      params.require(:try).permit(:content)
    end

    def redmine_params
      params.require(:redmine).permit(:subject, :description, :project_id, :assignd_to_id)
    end
end
