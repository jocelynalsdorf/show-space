require 'rails_helper'

describe "the delete a post process" do
  it "deletes a new post" do
    post = FactoryGirl.create(:post)
    visit root_path
    click_link post.title
    click_link 'Delete'
    expect(page).to have_no_content post.title
  end


end