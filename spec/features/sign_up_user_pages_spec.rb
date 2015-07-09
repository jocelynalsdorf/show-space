require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!


describe "sign up new user" do
  it "adds a new user" do  
    visit posts_path
    click_link 'Sign Up'
    fill_in("Name", with: 'bob', :match => :prefer_exact)
    fill_in("Email", with: 'jay@gmail.com', :match => :prefer_exact)
    fill_in("Password", with: '12345678', :match => :prefer_exact)
    fill_in("Password confirmation", with: '12345678', :match => :prefer_exact)
    click_on'Sign up'
    expect(page).to have_content "bob"
  end

end