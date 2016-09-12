require 'rails_helper'


describe "Root path" do
  context "with no countries added" do
    it "displays text 'No countries added yet!'" do
      visit root_path
      expect(page).to have_content "No countries added yet!"
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

end
