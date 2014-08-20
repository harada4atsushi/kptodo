class Provider < ActiveRecord::Base
  TODOIST = "todoist"
  REDMINE = "redmine"

  validates :access_token, presence: true
end