require 'active_resource' 

class Issue < ActiveResource::Base
  class << self
    attr_accessor :key
  end

  def save
    prefix_options[:key] = self.class.key
    super
  end

  self.site = "xxxx"
  self.user = "xxxxx" # basic
  self.password = "xxxxx" # basic
  self.key = "xxxxx" # api_key
    
  #include Virtus.model
  #include ActiveModel::Validations
  #include ActiveModel::Conversion
  #extend ActiveModel::Naming

  #attribute :subject, String
  #attribute :description, String
  #attribute :project_id, Integer
  #attribute :assignd_to_id, Integer

  #validates :subject, presence: true

  def export
    self.attributes = {
      issue: {
        subject: "件名",
        description: "説明",
        project_id: 1
      }
    }
    unless self.save
      binding.pry
    end
  end
end