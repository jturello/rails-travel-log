require 'rails_helper'

describe 'country_destination_path' do

  context 'when country link is clicked' do
    it 're-displays the country detail page' do
      @destination = FactoryGirl.create :destination
      visit country_destination_path @destination.country, @destination
      click_on @destination.country.name
      expect(page).to have_content "Mordor's Country Detail Page"
    end
  end

  context 'when Delete is clicked' do
    it "deleted destionation's country page displays" do
      @destination = FactoryGirl.create :destination
      visit country_destination_path @destination.country, @destination
      click_on 'Delete'
      expect(page).to have_content "Mordor's Country Detail Page"
    end

    it "displays flash notice - Destination deleted successfully!" do
      @destination = FactoryGirl.create :destination
      visit country_destination_path @destination.country, @destination
      click_on 'Delete'
      expect(page).to have_content "Destination deleted successfully!"
    end
  end

  context 'when Edit is clicked' do
    it "displays Update Destionation page" do
      @destination = FactoryGirl.create :destination
      visit country_destination_path @destination.country.id, @destination.id
      click_on 'Edit'
      expect(page).to have_content "Update Destination"
    end
  end

end
