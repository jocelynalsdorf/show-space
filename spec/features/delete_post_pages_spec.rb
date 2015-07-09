require 'rails_helper'

describe "the delete a post process" do
  it "deletes a new post" do
    visit posts_path
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    click_link 'Add New Post'
    fill_in 'Title', :with => 'bug'
    fill_in 'Link', :with => 'bug.com'
    fill_in 'Description', :with => 'this sucks'
    click_on 'Create Post'  
    click_link 'Delete'
    expect(page).to have_no_content 'bug'
  end

end