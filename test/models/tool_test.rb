require 'test_helper'

class ToolTest < ActiveSupport::TestCase
  test "valid tool had name" do
    tool = Tool.new(name: "Hammer")
    assert tool.valid?
  end

  test "invalid tool does not have name" do
    tool = Tool.new
    refute tool.valid?
  end
end
