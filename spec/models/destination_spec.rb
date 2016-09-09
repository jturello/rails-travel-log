require 'rails_helper'

describe Destination do
  it { should validate_presence_of :name }
  it { should validate_presence_of :blurb }
  it { should validate_presence_of :description }
  it { should have_db_index :country_id }
end
