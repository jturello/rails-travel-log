require 'rails_helper'

describe Forecast do

  it { should validate_presence_of :destination_id }
  it { should validate_presence_of :latitude }
  it { should validate_presence_of :longitude }
  it { should belong_to :destination }
  it { should have_db_index :destination_id }
  it { should validate_inclusion_of(:latitude).in_range(-90..90) }
  it { should validate_inclusion_of(:longitude).in_range(-180..180) }
end
