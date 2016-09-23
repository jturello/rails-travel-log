class Country < ActiveRecord::Base
  has_many :destinations
  has_many :posts, as: :commentable

  validates_associated :destinations
  validates :name, :blurb, :description, :presence => true

end
