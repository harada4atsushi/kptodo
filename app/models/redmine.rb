class Redmine
  include Virtus.model
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attribute :subject, String
  attribute :description, String
  attribute :project_id, Integer
  attribute :assignd_to_id, Integer
end