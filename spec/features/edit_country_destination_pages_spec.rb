require 'rails_helper'

describe 'edit_country_destinations_path' do

  context 'when country link is clicked' do
    it 'displays the country detail page' do
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

    it 'displays flash notice on successful deletion' do
      @destination = FactoryGirl.create :destination
      visit country_destination_path @destination.country, @destination
      click_on 'Delete'
      expect(page).to have_content "Destination deleted successfully!"
    end
  end

  context 'when Edit is clicked' do
    it "Update Destionation page displays" do
      @destination = FactoryGirl.create :destination
      visit country_destination_path @destination.country, @destination
      click_on 'Edit'
      expect(page).to have_content "Update Destination"
    end

    context 'then Update is clicked' do
      it "updates destination" do
        @destination = FactoryGirl.create :destination
        visit country_destination_path @destination.country, @destination
        click_on 'Edit'
        fill_in 'Name', :with => 'Moria'
        click_on 'Update Destination'
        expect(page).to have_content "Moria's Destination Detail Page"
      end

      it 'displays flash notice on successful update' do
        @destination = FactoryGirl.create :destination
        visit country_destination_path @destination.country, @destination
        click_on 'Edit'
        fill_in 'Name', :with => 'Moria'
        click_on 'Update Destination'
        expect(page).to have_content "Destination updated successfully!"
      end

    end




    context 'then Cancel Update is clicked'
      it "does not update destination" do
        @destination = FactoryGirl.create :destination
        visit country_destination_path @destination.country, @destination
        click_on 'Edit'
        fill_in 'Name', :with => 'Moria'
        click_on 'Cancel Update'
        expect(page).to have_content "Barad Dur's Destination Detail Page"
      end
    end


end
