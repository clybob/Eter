require 'test_helper'

class EditorialsControllerTest < ActionController::TestCase
  setup do
    @editorial = editorials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:editorials)
    assert_index_tags 10, 4
    assert_paginate_is_displayed
  end

  test "should get index paginated" do
    get( :index, { 'page' => '2' }  )
    assert_response :success
    assert_not_nil assigns(:editorials)
    assert_index_tags 1, 4
    assert_paginate_is_displayed
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create editorial" do
    assert_difference('Editorial.count') do
      post :create, editorial: @editorial.attributes
    end

    assert_redirected_to editorial_path(assigns(:editorial))
  end

  test "should not create editorial with invalid data" do
    @new_editorial = Editorial.new(uri: "")
    assert_equal @new_editorial.save, false
  end

  test "should show editorial" do
    get :show, id: @editorial
    assert_show_tag_p(2)
    assert_select ".span12", /#{@editorial.uri}/
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @editorial
    assert_response :success
  end

  test "should edit uri of editorial" do
    @editorial.uri = "URI1"
    @editorial.save!
    assert_equal(@editorial.uri, "URI1")
  end

  test "should edit with invalid data" do
    @editorial.uri = ""
    assert_equal @editorial.save, false
  end

  test "should update editorial" do
    put :update, id: @editorial, editorial: @editorial.attributes
    assert_redirected_to editorial_path(assigns(:editorial))
  end

  test "should destroy editorial" do
    assert_difference('Editorial.count', -1) do
      delete :destroy, id: @editorial
    end

    assert_redirected_to editorials_path
  end
end
