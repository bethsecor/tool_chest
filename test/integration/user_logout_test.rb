require 'test_helper'

class UserLogoutTest < ActionDispatch::IntegrationTest
  test "logged in user can log out" do
    user = User.create(username: "Maddie", password: "password123")

    visit login_path
    fill_in "Username", with: "Maddie"
    fill_in "Password", with: "password123"
    click_button "Login"

    assert page.has_content?("Maddie")

    click_link "Logout"
    refute page.has_content?("Maddie")
  end
end
