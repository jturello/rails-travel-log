require 'rails_helper'

describe :forecast do

  before :each do
    @destination = create(:destination)
    visit country_destination_path @destination.country.id, @destination.id
  end

  context 'when user is not logged in' do

    it 'does not display Check Weather link' do
      expect(page).not_to have_link('Check Weather', :href =>(new_destination_forecast_path(@destination)))
    end

    it 'displays message: no forecast added yet' do
      expect(page).to have_text('No forecasts added yet!')
    end

  end

  context 'when user is logged in' do
    before :each do
      user = create(:user)
      login_as(user, :scope => :user)
      visit country_destination_path @destination.country.id, @destination.id
    end

    it 'displays the check weather link' do
      expect(page).to have_link('Check Weather', :href =>(new_destination_forecast_path(@destination)))
    end

    it 'displays message: no forecast added yet' do
      expect(page).to have_text('No forecasts added yet!')
    end

    context 'when request is submitted with valid input' do

      before :each do
        click_on 'Check Weather'
        fill_in 'forecast_latitude', :with => '37.8267'
        fill_in 'forecast_longitude', :with => '-122.4233'
        click_on 'Submit'
      end

      it "displays flash[:notice] 'Forecast data fetched successfully!'" do
        expect(page).to have_css('.flash-notice', :text => "Forecast data fetched successfully!")
      end

      it "increments @destination.forecasts.count to equal 1" do
        expect(@destination.forecasts.count).to eq(1)
      end

      it "displays Time Zone 'America/Los Angeles' for request latitude: 37.8267 / longitude: -122.4233" do
        expect(page).to have_content('Time Zone').and have_content('America/Los_Angeles')
      end

      context 'when user logs out' do

        before :each do
          click_link 'Logout'
          visit country_destination_path @destination.country.id, @destination.id
        end

        it 'displays previously generated forecasts' do
          expect(page).to have_xpath('.//tr/th', text: '7 Day Forecast')
        end

        it "still displays Time Zone 'America/Los Angeles' for request latitude: 37.8267 / longitude: -122.4233" do
          expect(page).to have_content('Time Zone').and have_content('America/Los_Angeles')
        end
      end
    end
  end
end
