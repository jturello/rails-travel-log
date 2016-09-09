class Country < ActiveRecord::Base
  has_many :destinations
  validates_associated :destinations

  validates :name, :blurb, :description, :presence => true
  validates :region_id, :uniqueness => true
end
