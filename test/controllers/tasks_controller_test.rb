require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url,  xhr: true,  params: { task: { completed: @task.completed, name: @task.name } }
    end

    assert_response :success
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end

  test "should complete task" do
    patch complete_task_url(@task), xhr: true, params: {id: @task.id, completed: true} 
    assert_response :success
  end

  test "should incomplete task" do
    patch uncomplete_task_url(@task), xhr: true, params: {id: @task.id, completed: false} 
    assert_response :success
  end
end
