require 'rails_helper'

describe "the edit a post process" do
  it "edits a post" do
    visit root_path
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = FactoryGirl.create(:post)
    click_link 'Add New Post'
    fill_in 'Title', :with => post.title
    fill_in 'Link', :with => post.link
    fill_in 'Description', :with => post.description
    click_on 'Create Post'
    click_link 'Edit'
    fill_in 'Title', :with => 'new title'
    fill_in 'Link', :with => 'new link'
    fill_in 'Description', :with => 'new description'
    click_on 'Update Post'
    expect(page).to have_content 'new title'
  end

  it "gives an error when no data is entered into form fields" do
   visit root_path
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = FactoryGirl.create(:post)
    click_link 'Add New Post'
    fill_in 'Title', :with => post.title
    fill_in 'Link', :with => post.link
    fill_in 'Description', :with => post.description
    click_on 'Create Post'
    click_link 'Edit'
    fill_in 'Title', :with => ''
    fill_in 'Link', :with => ''
    fill_in 'Description', :with => ''
    click_on 'Update Post'
    expect(page).to have_content 'errors'
  end

end