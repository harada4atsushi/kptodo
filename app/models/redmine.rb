require 'active_resource' 

class Redmine < ActiveResource::Base
  self.site = "https://redmine-dev.j-caw.co.jp/"
  self.user = "redmine-develop"
  self.password = "3X2WBGSh4F2Q"
  	
  include Virtus.model
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attribute :subject, String
  attribute :description, String
  attribute :project_id, Integer
  attribute :assignd_to_id, Integer

  validates :subject, presence: true

  def export
  	self.subject = "件名"
  	self.description = "説明"
  	self.project_id = 1
  	binding.pry
  	save
  end
end