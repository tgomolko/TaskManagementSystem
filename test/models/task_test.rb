require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  setup do
    @task = tasks(:one)
  end
 
  test "should not save task without name" do
    @task.name = ""
    @task.save

    assert_equal  @task.errors.full_messages.last, "Name can't be blank"
  end
end
