require 'rails_helper'

describe 'country_path' do
  context 'when Add Destination link is clicked' do
    it "displays Add Destination page" do
      @country = FactoryGirl.create(:country)
      visit country_path @country
      click_on 'Add Destination'
      expect(page).to have_content('New Destination')
    end
  end

  context 'when Delete is clicked' do
    it "deletes country" do
      @country = FactoryGirl.create(:country)
      visit country_path @country
      click_on 'Delete'
      expect(page).not_to have_content('Mordor')
    end
  end

  context 'when destination link is clicked' do
    it 'displays destination detail page' do
      @destination = FactoryGirl.create :destination
      visit country_path @destination.country
      expect(page).to have_content 'Barad Dur'
    end
  end

end
