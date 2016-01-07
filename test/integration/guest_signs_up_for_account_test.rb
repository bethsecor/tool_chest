require 'test_helper'

class GuestSignsUpForAccountTest < ActionDispatch::IntegrationTest
  test "user is registered" do
    visit root_path

    assert page.has_content?("Welcome!")
    assert page.has_link?("Create Account")

    click_on "Create Account"

    assert_equal current_path, new_user_path
    fill_in "Username", with: "Ruby"
    fill_in "Password", with: "12345"
    fill_in "Password confirmation", with: "12345"
    click_button "Create Account"

    Tool.create(name: "map", use: "stuff", user_id: 1)

    assert_equal current_path, tools_path
    assert page.has_content?("Ruby")
    assert page.has_content?("Account created.")
  end
end
