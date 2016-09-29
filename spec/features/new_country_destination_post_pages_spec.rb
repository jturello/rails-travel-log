require 'rails_helper'

describe 'new_country_destination_post_path' do

  context 'when user is not logged in' do

    it 'it does not display an add a post link' do
      @destination = FactoryGirl.create(:destination)
      visit country_destination_path @destination.country.id, @destination.id
      expect(page).not_to have_link('Add Post', :href =>(new_country_destination_post_path @destination.country.id, @destination.id))
    end

    context 'before posts are added' do

      it "displays text 'No posts added yet!'" do
        @destination = FactoryGirl.create(:destination)
        visit country_destination_path @destination.country.id, @destination.id
        expect(page).to have_content('No posts added yet!')
      end
    end

    context 'after posts are added' do

      it 'displays posts' do
        @post = FactoryGirl.create(:destination_post)
        visit country_destination_path @post.commentable.country.id, @post.commentable.id
        expect(page).to have_content('This is a destination post!')
      end
    end
  end

  context 'when user is logged in' do

    before :each do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      @destination = FactoryGirl.create(:destination)
    end

    it 'it does display an add a post link' do
      visit country_destination_path @destination.country.id, @destination.id
      expect(page).to have_link('Add Post', :href =>(new_country_destination_post_path @destination.country.id, @destination.id))
    end

    context "when 'Add Post' link is clicked" do

      it 'displays the New Post form' do
        visit country_destination_path @destination.country, @destination
        click_on 'Add Post'
        expect(page).to have_css('h2', text: 'New Post')
      end

      it 'successfully adds a new post' do
        visit country_destination_path @destination.country, @destination
        click_on 'Add Post'
        fill_in 'Content', with: 'This is a new destination post!'
        click_on 'Create Post'
        expect(page).to have_content('This is a new destination post!')
      end
    end
  end
end
