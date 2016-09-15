require 'rails_helper'

describe 'country_path' do

    it "displays the Add Destination page when Add Destination link is clicked" do
      @country = FactoryGirl.create(:country)
      visit country_path @country
      click_on 'Add Destination'
      expect(page).to have_content('New Destination')
    end

    it "deletes country when Delete is clicked" do
      @country = FactoryGirl.create(:country)
      visit country_path @country
      click_on 'Delete'
      expect(page).not_to have_content('Mordor')
    end

end
