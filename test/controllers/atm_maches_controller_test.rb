require 'test_helper'

class AtmMachesControllerTest < ActionController::TestCase
  setup do
    @atm_mach = atm_maches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:atm_maches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create atm_mach" do
    assert_difference('AtmMach.count') do
      post :create, atm_mach: { city: @atm_mach.city, name: @atm_mach.name, state: @atm_mach.state, street: @atm_mach.street, zip_code: @atm_mach.zip_code }
    end

    assert_redirected_to atm_mach_path(assigns(:atm_mach))
  end

  test "should show atm_mach" do
    get :show, id: @atm_mach
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @atm_mach
    assert_response :success
  end

  test "should update atm_mach" do
    patch :update, id: @atm_mach, atm_mach: { city: @atm_mach.city, name: @atm_mach.name, state: @atm_mach.state, street: @atm_mach.street, zip_code: @atm_mach.zip_code }
    assert_redirected_to atm_mach_path(assigns(:atm_mach))
  end

  test "should destroy atm_mach" do
    assert_difference('AtmMach.count', -1) do
      delete :destroy, id: @atm_mach
    end

    assert_redirected_to atm_maches_path
  end
end
