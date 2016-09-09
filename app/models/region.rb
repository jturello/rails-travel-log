class Region < ActiveRecord::Base
  has_many :countries
  validates_associated :countries

  validates :name, :blurb, :description, :presence => true
end
