require 'rails_helper'

describe Region do
  it { should validate_presence_of :name }
  it { should validate_presence_of :blurb }
  it { should validate_presence_of :description }

  it { should have_many :countries}
end
