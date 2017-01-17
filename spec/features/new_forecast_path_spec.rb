require 'rails_helper'

describe 'new_forecast_path' do

  context 'when user is not logged in' do

    it 'it does not display get forecast link' do
      @destination = FactoryGirl.create(:destination)
      visit country_destination_path @destination.country.id, @destination.id
      expect(page).not_to have_link('Get forecast', :href =>(new_destination_forecast_path(@destination)))

    end


  end

end
