require 'test_helper'

class PointsControllerTest < ActionController::TestCase
  setup do
    @point = points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:points)
  end
  
  test "should show point" do
    get :show, id: @point
    assert_response :success
  end

  test "should destroy points" do
    assert_difference('Point.count', -1) do
      delete :destroy, id: @point
    end
  assert_redirected_to points_path
  end
end
