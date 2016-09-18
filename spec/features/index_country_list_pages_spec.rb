require 'rails_helper'


describe "Root path" do

  before :each do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  context "with no countries" do
    it "displays text 'No countries added yet!'" do
      visit root_path
      expect(page).to have_content "No countries added yet!"
    end

    context "after last country is deleted" do
      it "displays text 'No countries added yet'" do
        @country = FactoryGirl.create(:country)
        visit country_path @country
        click_on 'Delete'
        expect(page).to have_content "No countries added yet!"
      end
    end
  end

  context "with one country added" do
    it "displays added country" do
      @country = Country.create({name: 'Mexico', blurb: 'Vengan a Mexico a disfrutar las playas, la historia, la comida, y la gente!', description: 'Central American country with exotic ruins, beautiful beaches, and a wor\ld class cuisine!'})
      visit root_path
      expect(page).to have_content('Mexico : Vengan a Mexico a disfrutar las playas, la historia, la comida, y la gente!')
    end
  end

  context "with more than one countries added" do
    it "displays countries alphabetically by name" do
      @country1 = Country.create({name: 'Algeria', blurb: 'Algeria', description: 'This is a description'})
      @country2 = Country.create({name: 'Albania', blurb: 'Albania', description: 'This is the description for Albania'})
      visit root_path
      expect(page).to have_content("Countries: Albania : Albania Algeria : Algeria")
    end
  end

  context "navbar" do
    it "displays new country page on clicking 'Add Country' button" do
      visit root_path
      click_on 'Add Country'
      expect(page).to have_css("h1", :text => "New Country")
    end
  end

end
