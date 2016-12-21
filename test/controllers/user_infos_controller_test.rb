require 'test_helper'

class UserInfosControllerTest < ActionController::TestCase
  setup do
    @user_info = user_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_info" do
    assert_difference('UserInfo.count') do
      post :create, user_info: { city: @user_info.city, email: @user_info.email, first_name: @user_info.first_name, last_name: @user_info.last_name, phone: @user_info.phone, state: @user_info.state, street: @user_info.street, user_id: @user_info.user_id, zip_code: @user_info.zip_code }
    end

    assert_redirected_to user_info_path(assigns(:user_info))
  end

  test "should show user_info" do
    get :show, id: @user_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_info
    assert_response :success
  end

  test "should update user_info" do
    patch :update, id: @user_info, user_info: { city: @user_info.city, email: @user_info.email, first_name: @user_info.first_name, last_name: @user_info.last_name, phone: @user_info.phone, state: @user_info.state, street: @user_info.street, user_id: @user_info.user_id, zip_code: @user_info.zip_code }
    assert_redirected_to user_info_path(assigns(:user_info))
  end

  test "should destroy user_info" do
    assert_difference('UserInfo.count', -1) do
      delete :destroy, id: @user_info
    end

    assert_redirected_to user_infos_path
  end
end
