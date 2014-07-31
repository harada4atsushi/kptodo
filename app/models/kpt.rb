class Kpt < ActiveRecord::Base
  has_many :keeps
  has_many :problems
  has_many :tries
  accepts_nested_attributes_for :keeps, :problems, :tries
end
