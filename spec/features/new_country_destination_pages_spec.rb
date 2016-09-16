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

end
