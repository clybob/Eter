require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
    assert_index_tags 10, 7
    assert_paginate_is_displayed
  end

  test "should get index paginated" do
    get( :index, { 'page' => '2' }  )
    assert_response :success
    assert_not_nil assigns(:users)
    assert_index_tags 1, 7
    assert_paginate_is_displayed
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    @user.email = 'juju@eter.com'
    assert_difference('User.count') do
      post :create, user: @user.attributes
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_show_tag_p(5)
    assert_select ".span12", /#{@user.name}/
    assert_select ".span12", /#{@user.email}/
    assert_select ".span12", /#{@user.oauth_token}/
    assert_select ".span12", /#{@user.oauth_token_secret}/
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end
  
  test "should edit name of user" do
    @user.name = "Testando"
    @user.save!
    assert_equal(@user.name, "Testando")
  end
  

  test "should update user" do
    put :update, id: @user, user: @user.attributes
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end

  test "should get index and have table with eleven tr" do
    get :index

    assert_select 'table' do
      assert_select 'tr', 11
    end
  end
end
