require 'rails_helper'

describe 'country_path' do

  before :each do
    user = create(:user)
    login_as(user, :scope => :user)
  end

  context 'when user is logged in' do

    it "does display the 'Add Post' link" do
      @country = create :country
      visit country_path(@country)
      expect(page).to have_link('Add Post', :href=>new_country_post_path(@country))
    end

    context 'when Add Destination link is clicked' do
      it "displays Add Destination page" do
        @country = create(:country)
        visit country_path @country
        click_on 'Add Destination'
        expect(page).to have_css('h2', :text => 'New Destination')
      end
    end

      context 'when Destination link is clicked' do
        it 'displays destination detail page' do
          @destination = create :destination
          visit country_path @destination.country
          expect(page).to have_content 'Barad Dur'
        end
      end

    context 'when Delete is clicked' do
      it "deletes country" do
        @country = create(:country)
        visit country_path @country
        click_on 'Delete'
        expect(page).not_to have_content('Mordor')
      end
    end

    context 'when Edit link is clicked' do
      it 'displays Edit Country page' do
        @country = create :country
        visit country_path @country
        click_on 'Edit'
        expect(page).to have_css("h1", :text => 'Update Country')
      end
    end
  end

  context 'when user is not logged in' do

    before :each do
      logout :user
    end

    it "does not display the 'Edit' link" do
      @country = create :country
      visit country_path(@country)
      expect(page).to_not have_link('Edit', :href=>edit_country_path(@country))
    end

    it "does not display the 'Delete' link" do
      @country = create :country
      visit country_path(@country)
      expect(page).to_not have_link('Delete', :href=>country_path(@country))
    end

    it "does not display the 'Add Destination' link" do
      @country = create :country
      visit country_path(@country)
      expect(page).to_not have_link('Add Destination', :href=>new_country_destination_path(@country))
    end

    it "does not display the 'Add Post' link" do
      @country = create :country
      visit country_path(@country)
      expect(page).to_not have_link('Add Post', :href=>new_country_post_path(@country))
    end
  end

  context 'Navbar' do
     context 'when Travel Log logo is clicked' do
       it 'displays the index page (root_path)', :type => :view do
         @country = create :country
         visit country_path @country
         click_on 'Travel Log'
         expect(response).to render_template('countries/index')
       end
     end
  end
end
