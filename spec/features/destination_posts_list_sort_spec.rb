require 'rails_helper'

describe "destination post list sorting with ajax" do
  before :each do
    @user_2 = create(:user, :username => 'User Two', :email => 'different@email.com')
    @destination = create(:destination)
    @post_1 = create(:destination_post, :content => 'first post', :commentable => @destination)
    @post_2 = create(:destination_post, :content => 'second post', :user => @user_2, :commentable => @destination)
  end
  context "when user is not logged in" do
    context "on initial Destination Detail page load" do

      it "displays post list in Last Updated DESC order" do
        visit country_destination_path(@post_1.commentable.country, @post_1.commentable)
        within(:xpath, "//table/tr[1]") do
          expect(page).to have_content "second post"
        end
        within(:xpath, "//table/tr[2]") do
          expect(page).to have_content("first post")
        end
      end
    end

    context "on clicking Last Updated header sort link" do

      it "displays post list in Last Updated ASC order" do
        visit country_destination_path(@post_1.commentable.country, @post_1.commentable)
        click_on 'Last Updated'
        within(:xpath, "//table/tr[1]") do
          expect(page).to have_content "first post"
        end
        within(:xpath, "//table/tr[2]") do
          expect(page).to have_content("second post")
        end
      end
    end
  end # End context when user not logged in

  context "when user is logged in" do

    before :each do
      user = create(:user, :username => "User Three", :email => 'another@email.com')
      login_as(user, :scope => :user)
    end

    context "on adding a new post via Ajax" do

      it "prepends new post to top of post list", js: true  do
        visit country_destination_path(@post_1.commentable.country, @post_1.commentable)
        click_on 'Add Post'
        fill_in 'Content', :with => 'Third post!'
        click_on 'Create Post'
        within(:xpath, "//tbody/tr[1]") do
          expect(page).to have_content "Third post!"
        end
      end
    end
  end

end
