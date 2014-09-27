class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    #@departments_map = Department.code_name_map(1)
  end
end
