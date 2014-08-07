class Preference < ActiveRecord::Base

  def linked_todoist?
    todoist_api_token.present?
  end

  def linked_github?
    github_api_token.present?
  end
end