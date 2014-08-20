class Providers::RedmineController < ApplicationController
  
   def new
    @provider = Provider.new(provider: Provider::REDMINE)
  end

  def create
    provider = Provider.new(provider_params)
    provider.provider = Provider::REDMINE
    current_user.providers << provider
    redirect_to edit_preference_path
  end

  def destroy
    current_user.providers.where(provider: Provider::REDMINE).destroy_all
    redirect_to edit_preference_path
  end

  private
    def provider_params
      params.require(:provider).permit(:access_token)
    end
end