class Destination < ActiveRecord::Base
  validates :name, :blurb, :description, :presence => true
  validates :country_id, :uniqueness => true
end
