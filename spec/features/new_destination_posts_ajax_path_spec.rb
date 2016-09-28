require 'rails_helper'

describe "adding a new destination post with ajax" do
  before :each do
    @destination = FactoryGirl.create :destination
  end

  context "when user is not logged in" do

    it "does not display the Add Post link" do
      visit country_destination_path(@destination.country, @destination)
      expect(page).not_to have_link("Add Post", href: new_country_destination_post_path(@destination.country, @destination))
    end
  end

  context "when user is logged in" do
    before :each do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
    end

    it "displays the Add Post link" do
      visit country_destination_path(@destination.country.id, @destination.id)
      expect(page).to have_link("Add Post", href: new_country_destination_post_path(@destination.country, @destination))
    end

    it "adds a new post with server request / full page load" do
      visit country_destination_path(@destination.country.id, @destination.id)
      click_on 'Add Post'
      fill_in "Content", :with => 'Here is a new post!'
      click_on 'Create Post'
      expect(page).to have_link('Last Updated')
    end

    it "adds a new post with ajax", js: true do
      visit country_destination_path(@destination.country.id, @destination.id)
      click_on 'Add Post'
      expect(page).to have_link(@destination.country.name + " Page", :href => country_path(@destination.country))
      expect(page).to have_content "Content"
    end
  end
end
