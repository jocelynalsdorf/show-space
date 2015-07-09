require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!


describe "the edit a comment process" do
  it "edits a users own comment" do  
    visit posts_path
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = FactoryGirl.create(:post)
    click_link 'Add New Post'
    fill_in 'Title', :with => post.title
    fill_in 'Link', :with => post.link
    fill_in 'Description', :with => post.description
    click_on 'Create Post'
    comment = FactoryGirl.create(:comment)
    fill_in 'Reply to thread', :with => comment.content
    click_on 'Create Comment'
    click_link comment.content
    click_link 'Edit'
    fill_in 'Content', :with => "changed my comment"
    click_on 'Update Comment'
    expect(page).to have_content "changed my comment"

  end
it "gives an error when no data is entered into form fields" do
   visit posts_path
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = FactoryGirl.create(:post)
    click_link 'Add New Post'
    fill_in 'Title', :with => post.title
    fill_in 'Link', :with => post.link
    fill_in 'Description', :with => post.description
    click_on 'Create Post'
    comment = FactoryGirl.create(:comment)
    fill_in 'Reply to thread', :with => comment.content
    click_on 'Create Comment'
    click_link comment.content
    click_link 'Edit'
    fill_in 'Content', :with => " "
    click_on 'Update Comment'
    expect(page).to have_content "What do you think you are doing??!!!"
    end
end