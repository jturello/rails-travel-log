require('rails_helper')

describe "new_country_path" do
  it "adds a new country" do
    visit root_path
    click_on 'New Country'
    fill_in 'Name', :with => 'Modor'
    fill_in 'Blurb', :with => 'Sights to see - the Eye of Sauron'
    fill_in 'Description', :with => 'Billowing clouds of choking soot'
    click_on 'Create Country'
    expect(page).to have_content('Modor')
  end

  it "displays a warning message when Name is blank" do
    visit root_path
    click_on 'New Country'
    fill_in 'Name', :with => 'Modor'

    fill_in 'Description', :with => 'Billowing clouds of choking soot'
    click_on 'Create Country'
    expect(page).to have_content('Country not added. Try again!')
  end

  it "displays a warning message when Blurb is blank" do
    visit root_path
    click_on 'New Country'
    fill_in 'Name', :with => 'Modor'
    fill_in 'Blurb', :with => 'Sights to see - the Eye of Sauron'

    click_on 'Create Country'
    expect(page).to have_content('Country not added. Try again!')
  end

  it "displays a warning message when Name is blank" do
    visit root_path
    click_on 'New Country'

    fill_in 'Blurb', :with => 'Sights to see - the Eye of Sauron'
    fill_in 'Description', :with => 'Billowing clouds of choking soot'
    click_on 'Create Country'
    expect(page).to have_content('Country not added. Try again!')
  end

end
