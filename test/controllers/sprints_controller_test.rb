require 'test_helper'

class SprintsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sprints_index_url
    assert_response :success
  end

  test "should get new" do
    get sprints_new_url
    assert_response :success
  end

  test "should get create" do
    get sprints_create_url
    assert_response :success
  end

  test "should get update" do
    get sprints_update_url
    assert_response :success
  end

  test "should get show" do
    get sprints_show_url
    assert_response :success
  end

  test "should get destroy" do
    get sprints_destroy_url
    assert_response :success
  end

end
