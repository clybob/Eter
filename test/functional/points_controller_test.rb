require 'test_helper'

class PointsControllerTest < ActionController::TestCase
  setup do
    @point = points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:points)
    assert_index_tags 10, 5
    assert_paginate_is_displayed
  end

  test "should get index paginated" do
    get( :index, { 'page' => '2' }  )
    assert_response :success
    assert_not_nil assigns(:points)
    assert_index_tags 1, 5
    assert_paginate_is_displayed
  end
  
  test "should show point" do
    get :show, id: @point
    assert_show_tag_p(4)
    assert_select ".span12", /#{@point.user.name}/
    assert_response :success
  end

  test "should destroy points" do
    assert_difference('Point.count', -1) do
      delete :destroy, id: @point
    end
  assert_redirected_to points_path
  end
end
