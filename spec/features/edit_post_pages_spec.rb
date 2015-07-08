require 'rails_helper'

describe "the edit a post process" do
  it "adds a new post" do
    post = FactoryGirl.create(:post)
    visit root_path
    click_link post.title
    click_link 'Edit'
    fill_in 'Title', :with => post.title
    fill_in 'Link', :with => post.link
    fill_in 'Description', :with => post.description
    click_on 'Update Post'
    expect(page).to have_content post.title
  end

  it "gives an error when no data is entered into form fields" do
    post = FactoryGirl.create(:post)
    visit root_path
    click_link post.title
    click_link 'Edit'
    fill_in 'Title', :with => ''
    fill_in 'Link', :with => ''
    fill_in 'Description', :with => ''
    click_on 'Update Post'
    expect(page).to have_content 'errors'
  end

end