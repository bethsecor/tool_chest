require 'test_helper'

class UserSeesToolsTest < ActionDispatch::IntegrationTest
  test "logged in user sees list of their tools" do
    tool_1 = Tool.create(name: "Hammer", use: "thldshldts")
    tool_2 = Tool.create(name: "Wrench", use: "hrlahlrar")
    tool_3 = Tool.create(name: "Screwdriver", use: "dlhslhhrhrhr")

    user = User.create(username: "Maddie", password: "password123")
    user.tools << tool_1
    user.tools << tool_2

    visit login_path
    fill_in "Username", with: "Maddie"
    fill_in "Password", with: "password123"
    click_button "Login"

    assert page.has_content?("Maddie")
    within('#tools') do
      assert page.has_content?("#{tool_1.name}")
      assert page.has_content?("#{tool_2.name}")
    end

    visit new_tool_path
    fill_in "Name", with: "Pliers"
    fill_in "Use", with: "aaggfls"
    click_button "Create Tool"

    visit user_path(user.id)
    # save_and_open_page
    within('#tools') do
      assert page.has_content?("#{tool_1.name}")
      assert page.has_content?("#{tool_2.name}")
      assert page.has_content?("Pliers")
      refute page.has_content?("Screwdriver")
    end
  end
end
