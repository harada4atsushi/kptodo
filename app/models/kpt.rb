class Kpt < ActiveRecord::Base
  has_many :keeps, dependent: :destroy
  has_many :problems, dependent: :destroy
  has_many :tries, dependent: :destroy
  accepts_nested_attributes_for :keeps, :problems, :tries
end