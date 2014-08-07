class AddGithubTokenToPreference < ActiveRecord::Migration
  def change
    add_column :preferences, :github_api_token, :string
  end
end
