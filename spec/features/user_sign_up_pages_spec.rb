require('rails_helper')

describe "user sign up" do
  # before :each do
  #   user = create(:user)
  #   login_as(user, :scope => :user)
  # end


  context "with all required input provided" do
    it "it signs user up" do

      user = build :user
      visit new_user_registration_path
      fill_in 'Username', :with => user.username
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
      fill_in 'Password confirmation', :with => user.password_confirmation
      click_on 'Sign up'
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
  end

  context 'with required input omitted' do
    context 'when username is blank' do
      it "displays error message: Username can't be blank" do
        user = build(:user, :username => "")
        visit new_user_registration_path
        fill_in 'Username', :with => user.username
        fill_in 'Email', :with => user.email
        fill_in 'Password', :with => user.password
        fill_in 'Password confirmation', :with => user.password_confirmation
        click_on 'Sign up'
        expect(page).to have_content "Username can't be blank"
      end
    end

    context 'when email is blank' do
      it "displays error message: Email can't be blank" do
        user = build(:user, :email => "")
        visit new_user_registration_path
        fill_in 'Username', :with => user.username
        fill_in 'Email', :with => user.email
        fill_in 'Password', :with => user.password
        fill_in 'Password confirmation', :with => user.password_confirmation
        click_on 'Sign up'
        expect(page).to have_content "Email can't be blank"
      end
    end

    context 'when email is invalid' do
      it "displays error message: Email is invalid" do
        user = build(:user, :email => "a")
        visit new_user_registration_path
        fill_in 'Username', :with => user.username
        fill_in 'Email', :with => user.email
        fill_in 'Password', :with => user.password
        fill_in 'Password confirmation', :with => user.password_confirmation
        click_on 'Sign up'
        expect(page).to have_content "Email is invalid"
      end
    end

    context 'when password is blank' do
      it "displays error message: Password can't be blank" do
        user = build(:user, :password => "")
        visit new_user_registration_path
        fill_in 'Username', :with => user.username
        fill_in 'Email', :with => user.email
        fill_in 'Password', :with => user.password
        fill_in 'Password confirmation', :with => user.password_confirmation
        click_on 'Sign up'
        expect(page).to have_content "Password can't be blank"
      end
    end

    context 'when password is invalid' do
      it "displays error message: Password is invalid" do
        user = build(:user, :password => "a", :password_confirmation => "a")
        visit new_user_registration_path
        fill_in 'Username', :with => user.username
        fill_in 'Email', :with => user.email
        fill_in 'Password', :with => user.password
        fill_in 'Password confirmation', :with => user.password_confirmation
        click_on 'Sign up'
        expect(page).to have_content "Password is too short"
      end
    end

    context "when password & password_confirmation don't match" do
      it "displays error message: Password confirmation doesn't match Password" do
        user = build(:user, :password => "bad_password")
        visit new_user_registration_path
        fill_in 'Username', :with => user.username
        fill_in 'Email', :with => user.email
        fill_in 'Password', :with => user.password
        fill_in 'Password confirmation', :with => user.password_confirmation
        click_on 'Sign up'
        expect(page).to have_content "Password confirmation doesn't match Password"
      end
    end

    context 'when password_confirmation is blank' do
      it "displays error message: Username can't be blank" do
        user = build(:user, :password_confirmation => "")
        visit new_user_registration_path
        fill_in 'Username', :with => user.username
        fill_in 'Email', :with => user.email
        fill_in 'Password', :with => user.password
        fill_in 'Password confirmation', :with => user.password_confirmation
        click_on 'Sign up'
        expect(page).to have_content "Password confirmation can't be blank"
      end
    end
  end
end
