require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test "registered user can login" do
    user = User.create(username: "Maddie", password: "password123")

    visit root_path
    click_on "Login"

    assert_equal current_path, login_path

    fill_in "Username", with: "Maddie"
    fill_in "Password", with: "password123"
    click_button "Login"

    assert_equal current_path, user_path(User.last)
    assert page.has_content?("Maddie")
    assert page.has_content?("Welcome back!")
  end
end
