require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    visit root_path
  end

  test 'displays names of all users' do
    assert page.has_content?(@user.name)
  end

  test 'display a container with background of profile photos' do
    assert page.has_css?('div.image-placeholder')
  end

  test 'displays the number of posts for each user' do
    assert page.has_content?("Number of posts: #{@user.posts_counter}")
  end

  test "redirects to the user's show page" do
    click_link_or_button 'view details', match: :first
    assert_current_path user_path(@user)
  end
end
