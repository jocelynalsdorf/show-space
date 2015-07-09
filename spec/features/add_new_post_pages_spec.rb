require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!


describe "the add a post process" do
  it "adds a new post" do  
    visit posts_path
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = FactoryGirl.create(:post)
    click_link 'Add New Post'
    fill_in 'Title', :with => post.title
    fill_in 'Link', :with => post.link
    fill_in 'Description', :with => post.description
    click_on 'Create Post'
    expect(page).to have_content post.title
  end

  it "gives an error when no data is entered into form fields" do
    visit posts_path
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = FactoryGirl.create(:post)
    click_link 'Add New Post'
    fill_in 'Title', :with => ''
    fill_in 'Link', :with => ''
    fill_in 'Description', :with => ''
    click_on 'Create Post'
    expect(page).to have_content 'errors'
  end

end