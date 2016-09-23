class Destination < ActiveRecord::Base
  belongs_to :country
  has_many :posts, as: :commentable

  validates :name, :blurb, :description, :presence => true
  validates :country_id, :presence => true
end
