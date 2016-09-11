class Destination < ActiveRecord::Base
  belongs_to :country

  validates :name, :blurb, :description, :presence => true
  validates :country_id, :uniqueness => true
end
