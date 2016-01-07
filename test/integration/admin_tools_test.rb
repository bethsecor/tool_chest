require 'test_helper'

class AdminToolsTest < ActionDispatch::IntegrationTest
  test 'logged in admin sees tools index' do
    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)
    User.create(username: "Lizzie", password: "1")
    Tool.create(name: "map", use: "stuff", user_id: 1)
    Tool.create(name: "hammer", use: "stuff", user_id: 1)
    Tool.create(name: "spring", use: "stuff", user_id: 2)
    Tool.create(name: "card", use: "stuff", user_id: 2)
    Tool.create(name: "ruler", use: "stuff", user_id: 2)
    Tool.create(name: "compass", use: "stuff", user_id: 2)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_tools_path
    assert page.has_content?("Tools!")

    Tool.all.each do |tool|
      assert page.has_link?(tool.name, admin_tool_path(tool))
    end
  end
end
