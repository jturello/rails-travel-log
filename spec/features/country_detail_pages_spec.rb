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
      expect(page).to have_css('h2', :text => 'New Destination')
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

  context 'when user is not logged in' do
    it "does not display the 'Edit' link" do
      logout :user
      @country = FactoryGirl.create :country
      visit edit_country_path(@country)
      expect(page).to_not have_link('Edit', :href=>edit_country_path(@country))
    end

    it "does not display the 'Delete' link" do
      logout :user
      @country = FactoryGirl.create :country
      visit edit_country_path(@country)
      expect(page).to_not have_link('Delete', :href=>country_path(@country))
    end

    it "does not display the 'Add Destination' link" do
      logout :user
      @country = FactoryGirl.create :country
      visit edit_country_path(@country)
      expect(page).to_not have_link('Add Destination', :href=>country_path(@country))
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
