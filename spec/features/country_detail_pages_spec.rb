require 'rails_helper'

describe 'country_path' do

  before :each do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end
  
  context 'when Add Destination link is clicked' do
    it "displays Add Destination page" do
      @country = FactoryGirl.create(:country)
      visit country_path @country
      click_on 'Add Destination'
      expect(page).to have_content('New Destination')
    end
  end

    context 'when Destination link is clicked' do
      it 'displays destination detail page' do
        @destination = FactoryGirl.create :destination
        visit country_path @destination.country
        expect(page).to have_content 'Barad Dur'
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

  context 'when Edit link is clicked' do
    it 'displays Edit Country page' do
      @country = FactoryGirl.create :country
      visit country_path @country
      click_on 'Edit'
      expect(page).to have_css("h1", :text => 'Update Country')
    end
  end

  context 'Navbar' do
     context 'when Travel Log logo is clicked' do
       it 'displays the index page (root_path)' do
         @country = FactoryGirl.create :country
         visit country_path @country
         click_on 'Travel Log'
         expect(page).to have_css('h1', :text => 'Vacation Country Destinations')
       end
     end
  end

end
