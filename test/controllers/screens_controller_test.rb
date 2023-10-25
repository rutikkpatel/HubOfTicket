require "test_helper"

class ScreensControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get screens_index_url
    assert_response :success
  end

  test "should get new" do
    get screens_new_url
    assert_response :success
  end

  test "should get show" do
    get screens_show_url
    assert_response :success
  end

  test "should get edit" do
    get screens_edit_url
    assert_response :success
  end
end
