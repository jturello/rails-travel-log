require 'rails_helper'

describe Forecast do

  it { should validate_presence_of :destination_id }
  it { should validate_presence_of :api_timestamp }
  it { should belong_to :destination }
  it { should have_db_index :destination_id }

end
