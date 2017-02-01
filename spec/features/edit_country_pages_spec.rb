require('rails_helper')

describe "edit_country_path" do

  before :each do
    user = create(:user)
    login_as(user, :scope => :user)
  end

  context 'when Name is updated' do

    it "updates Name" do
      @country = create(:country)
      visit root_path
      click_on 'Mordor : Sights to see - the Eye of Sauron!'
      click_on 'Edit'
      fill_in 'Name', :with => 'Moria'
      fill_in 'Blurb', :with => 'Sights to see - the Crack of Doom'
      fill_in 'Description', :with => 'Wet, damp, and dark. What better place to spend your vacation?'
      click_on 'Update Country'
      expect(page).to have_content('Moria')
    end

    it "does not change Blurb when only Name is updated" do
      @country = create :country
      visit root_path
      click_on 'Mordor : Sights to see - the Eye of Sauron!'
      click_on 'Edit'
      fill_in 'Name', :with => 'Moria'
      click_on 'Update Country'
      expect(page).to have_content('Sights to see - the Eye of Sauron!')
    end
  end

  context 'when Cancel Update is clicked' do
    it "does not update country" do
      @country = create(:country)
      visit root_path
      click_on 'Mordor : Sights to see - the Eye of Sauron!'
      click_on 'Edit'
      fill_in 'Name', :with => 'Moria'
      click_on 'Cancel Update'
      expect(page).not_to have_content("Moria's Country Detail Page")
    end
  end

    context 'when update succeeds' do
    it "displays a flash notice" do
      @country = create(:country)
      visit root_path
      click_on 'Mordor : Sights to see - the Eye of Sauron!'
      click_on 'Edit'
      fill_in 'Name', :with => 'Moria'
      click_on 'Update Country'
      expect(page).to have_content('Country updated successfully!')
    end
  end
end
