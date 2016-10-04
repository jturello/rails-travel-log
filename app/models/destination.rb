class Destination < ActiveRecord::Base
  belongs_to :country
  has_many :posts, as: :commentable
  has_many :forecasts

  validates :name, :blurb, :description, :presence => true
  validates :country_id, :presence => true
  validates_associated :posts, :forecasts
end
