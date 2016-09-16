require 'rails_helper'

describe 'new_country_destination_path' do

  it 'creates a new destination' do
    @country = FactoryGirl.create :country
    visit root_path
    click_on 'Mordor : Sights to see - the Eye of Sauron!'
    click_on 'Add Destination'
    fill_in 'Name', :with => 'Barad Dur'
    fill_in 'Blurb', :with => 'Beautiful city of Sauron with postcard perfect views of Mount Doom'
    fill_in 'Description', :with => "At the foothills of Ered Lithiu and just a 2 day's march to Mount Doom!"
    click_on 'Create Destination'
    expect(page).to have_content 'Barad Dur'
  end

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
  end

  context 'when Edit is clicked' do
    it "Update Destionation page displays" do
      @destination = FactoryGirl.create :destination

      visit country_destination_path @destination.country.id, @destination.id
      click_on 'Edit'
      expect(page).to have_content "Update Destination"
    end
  end

end
