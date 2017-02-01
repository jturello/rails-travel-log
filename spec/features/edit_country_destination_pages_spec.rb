require 'rails_helper'

describe 'edit_country_destination_path' do

  before :each do
    user = create(:user)
    login_as(user, :scope => :user)
  end

  context 'when Update is clicked' do
    it "updates destination" do
      @destination = create :destination
      visit country_destination_path @destination.country, @destination
      click_on 'Edit'
      fill_in 'Name', :with => 'Moria'
      click_on 'Update Destination'
      expect(page).to have_content "Moria's Destination Detail Page"
    end

    it "re-displays Destination Detail Page" do
      @destination = create :destination
      visit country_destination_path @destination.country, @destination
      click_on 'Edit'
      fill_in 'Name', :with => 'Moria'
      click_on 'Update Destination'
      expect(page).to have_content "Moria's Destination Detail Page"
    end

    it 'displays flash notice - Destination updated successfully!' do
      @destination = create :destination
      visit country_destination_path @destination.country, @destination
      click_on 'Edit'
      fill_in 'Name', :with => 'Moria'
      click_on 'Update Destination'
      expect(page).to have_content "Destination updated successfully!"
    end
  end

  context 'when Cancel Update is clicked' do
    it "does not update destination" do
      @destination = create :destination
      visit country_destination_path @destination.country, @destination
      click_on 'Edit'
      fill_in 'Name', :with => 'Moria'
      click_on 'Cancel Update'
      expect(page).to have_content "Barad Dur's Destination Detail Page"
    end

    it "re-displays Destination Detail Page" do
      @destination = create :destination
      visit country_destination_path @destination.country, @destination
      click_on 'Edit'
      fill_in 'Name', :with => 'Moria'
      click_on 'Cancel Update'
      expect(page).to have_content "Barad Dur's Destination Detail Page"
    end
  end
end
