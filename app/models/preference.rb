class Preference < ActiveRecord::Base

  def linked_todoist?
    todoist_api_token.present?
  end

end