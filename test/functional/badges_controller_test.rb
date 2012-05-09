require 'test_helper'

class BadgesControllerTest < ActionController::TestCase
  setup do
    @badge = badges(:one)
  end

  test "should get index" do
    get :index

    assert_response :success
    assert_not_nil assigns(:badges)
    assert_index_tags 10, 12
    assert_paginate_is_displayed
  end

  test "should get index paginated" do
    get( :index, { 'page' => '2' }  )
    assert_response :success
    assert_not_nil assigns(:badges)
    assert_index_tags 1, 12
    assert_paginate_is_displayed
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create badge" do
    assert_difference('Badge.count') do
      post :create, badge: @badge.attributes
    end

    assert_redirected_to badge_path(assigns(:badge))
  end

  test "should show badge" do
    get :show, id: @badge
    assert_show_tag_p(10)
    assert_select ".span12", /#{@badge.name}/
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @badge
    assert_response :success
  end

  test "should update badge" do
    put :update, id: @badge, badge: @badge.attributes
    assert_redirected_to badge_path(assigns(:badge))
  end

  test "should destroy badge" do
    assert_difference('Badge.count', -1) do
      delete :destroy, id: @badge
    end

    assert_redirected_to badges_path
  end
end
