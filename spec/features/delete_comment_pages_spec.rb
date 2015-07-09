describe "the delete a comment process" do
  it "delete users own comment" do  
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
    click_link 'Delete'
    expect(page).to have_content "Add Post"
    end
  end