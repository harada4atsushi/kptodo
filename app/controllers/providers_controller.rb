class ProvidersController < ApplicationController
  
  def todoist
    conn = Faraday.new(:url => 'https://api.todoist.com') do |faraday|
      faraday.request  :url_encoded       
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    uri = "/API/loginWithGoogle/?email=#{current_user.email}&oauth2_token=#{current_user.token}"
    response = conn.get uri
    doc = JSON.parse response.body
    #puts doc

    current_user.providers.create(provider: Provider::TODOIST, access_token: doc["token"])
    #current_user.preference.save

    redirect_to edit_preference_path

    # TODO offの処理
  end

=begin
  before_action :set_preference, only: [:edit, :update]

  def edit
  end

  def update
    if @preference.update(preference_params)
      redirect_to edit_preference_path, notice: 'Kpt was successfully updated.'
    else
      render :edit
    end
  end


  def github
    #binding.pry
    redirect_to user_omniauth_authorize_path(:github)
    #redirect_to edit_preference_path
  end

  private
    def set_preference
      @preference = current_user.preference || current_user.create_preference
    end

    def preference_params
      params.require(:preference).permit(:todoist_api_token)
    end
=begin

  

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

  def create
    @kpt = current_user.kpts.build(kpt_params)
    if @kpt.save
      redirect_to kpts_path, notice: '登録しました'
    else
      render :new
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
    Todoist::Base.setup(ENV["TODOIST_API_TOKEN"])
    project = Todoist::Project.all[0].add_task(try_params[:content], { "date_string" => "tomorrow" })
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    

    # Never trust parameters from the scary internet, only allow the white list through.
    
    def try_params
      params.require(:try).permit(:content)
    end
=end
end