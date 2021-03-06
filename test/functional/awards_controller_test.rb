require 'test_helper'

class AwardsControllerTest < ActionController::TestCase
  setup do
    @award = awards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:awards)
    assert_index_tags 10, 6
    assert_paginate_is_displayed
  end

  test "should get index paginated" do
    get( :index, { 'page' => '2' }  )
    assert_response :success
    assert_not_nil assigns(:awards)
    assert_index_tags 1, 6
    assert_paginate_is_displayed
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create award" do
    assert_difference('Award.count') do
      post :create, award: @award.attributes
    end

    assert_redirected_to award_path(assigns(:award))
  end

  test "should not create award with invalid data" do
    @new_award = Award.new(name: "")
    assert_equal @new_award.save, false
  end


  test "should show award" do
    get :show, id: @award
    assert_show_tag_p(4)
    assert_select ".span12", /#{@award.name}/
    assert_select ".span12", /#{@award.description}/
    assert_select ".span12", /#{@award.url}/
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @award
    assert_response :success
  end

  test "should edit name of award" do
    @award.name = "Award1"
    @award.save!
    assert_equal(@award.name, "Award1")
  end

  test "should with invalid data" do
    @award.name = ""
    assert_equal @award.save, false
  end

  test "should update award" do
    put :update, id: @award, award: @award.attributes
    assert_redirected_to award_path(assigns(:award))
  end

  test "should destroy award" do
    assert_difference('Award.count', -1) do
      delete :destroy, id: @award
    end

    assert_redirected_to awards_path
  end
end
