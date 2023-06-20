require 'test_helper'

class UserShowTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = posts(:one)
    visit user_path(@user)
  end

  test 'user show page' do
    assert page.has_content?(@user.name)
  end

  test "displays user's profile picture" do
    assert page.has_css?('div.image-placeholder')
  end

  test "renders the number of user's posts" do
    assert page.has_content?("Number of posts: #{@user.posts_counter}")
  end

  test "renders user's bio" do
    assert page.has_content?(@user.bio)
  end

  test "displays user's first 3 posts" do
    @user.user_recent_posts.each do |post|
      assert page.has_content?(post.title)
    end
  end

  test "displays a button to view all user's posts" do
    assert page.has_link?('See all posts', href: user_posts_path(@user))
  end

  test 'redirect to post show page' do
    click_link_or_button 'view details', match: :first
    assert_current_path user_post_path(@user, @post)
  end

  test 'redirect user to user posts index when user click see all posts' do
    click_link_or_button 'See all posts'
    assert_current_path user_posts_path(@user)
  end
end
