require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:one)
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "Task Management System"
  end

  test "creating a Task" do
    visit tasks_url
    click_on "New Task"

    fill_in "Completed", with: @task.completed
    fill_in "Name", with: @task.name
    click_on "Create Task"

    assert_text "Task was successfully added!"
    click_on "Back"
  end

  end
end
