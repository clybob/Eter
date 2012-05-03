require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
    assert_tag :tag => "table", :attributes => {:class=>"table table-striped"},
                   :child => {:tag => 'tbody',
                       :children => {:count => 10, :only=>{:tag=>"tr"}},
                       :child => {:tag => 'tr',
                           :children => {:count => 7, :only=>{:tag=>"td"}},
                       }
                  }
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
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
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
