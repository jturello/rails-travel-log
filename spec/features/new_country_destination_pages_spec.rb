require 'rails_helper'

describe 'new_country_destination_path' do

  context 'when add succeeds' do
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

    it 're-displays Country Detail Page' do
      @country = FactoryGirl.create :country
      visit country_path @country
      click_on 'Add Destination'
      fill_in 'Name', :with => 'Barad Dur'
      fill_in 'Blurb', :with => 'Beautiful city of Sauron with postcard perfect views of Mount Doom'
      fill_in 'Description', :with => "At the foothills of Ered Lithiu and just a 2 day's march to Mount Doom!"
      click_on 'Create Destination'
      expect(page).to have_content "Mordor's Country Detail Page"
    end

    it 'displays added destionation on Country Detail Page' do
      @country = FactoryGirl.create :country
      visit country_path @country
      click_on 'Add Destination'
      fill_in 'Name', :with => 'Barad Dur'
      fill_in 'Blurb', :with => 'Beautiful city of Sauron with postcard perfect views of Mount Doom'
      fill_in 'Description', :with => "At the foothills of Ered Lithiu and just a 2 day's march to Mount Doom!"
      click_on 'Create Destination'
      expect(page).to have_content 'Barad Dur : Beautiful city of Sauron with postcard perfect views of Mount Doom'
    end

    it 'displays flash notice - Destination successfully added!' do
      @country = FactoryGirl.create :country
      visit country_path @country
      click_on 'Add Destination'
      fill_in 'Name', :with => 'Barad Dur'
      fill_in 'Blurb', :with => 'Beautiful city of Sauron with postcard perfect views of Mount Doom'
      fill_in 'Description', :with => "At the foothills of Ered Lithiu and just a 2 day's march to Mount Doom!"
      click_on 'Create Destination'
      expect(page).to have_content 'Destination successfully added!'
    end
  end

  context 'when add fails' do
    it 're-displays New Destination Page' do
      @country = FactoryGirl.create :country
      visit new_country_destination_path @country
      click_on 'Create Destination'
      expect(page).to have_content 'New Destination'
    end

    it 'displays flash alert - Destination not added. Try again!' do
      @country = FactoryGirl.create :country
      visit country_path @country
      click_on 'Add Destination'
      click_on 'Create Destination'
      expect(page).to have_content 'Destination not added. Try again!'
    end

    it 'does not add new destination' do
      @country = FactoryGirl.create :country
      visit country_path @country
      click_on 'Add Destination'
      click_on 'Create Destination'
      click_on @country.name
      expect(page).to have_content 'No Destinations added yet!'
    end
  end
end
