require 'test_helper'

class NumberdetailsControllerTest < ActionController::TestCase
  setup do
    @numberdetail = numberdetails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:numberdetails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create numberdetail" do
    assert_difference('Numberdetail.count') do
      post :create, numberdetail: { amount: @numberdetail.amount, mobile_number: @numberdetail.mobile_number, service_provider: @numberdetail.service_provider }
    end

    assert_redirected_to numberdetail_path(assigns(:numberdetail))
  end

  test "should show numberdetail" do
    get :show, id: @numberdetail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @numberdetail
    assert_response :success
  end

  test "should update numberdetail" do
    put :update, id: @numberdetail, numberdetail: { amount: @numberdetail.amount, mobile_number: @numberdetail.mobile_number, service_provider: @numberdetail.service_provider }
    assert_redirected_to numberdetail_path(assigns(:numberdetail))
  end

  test "should destroy numberdetail" do
    assert_difference('Numberdetail.count', -1) do
      delete :destroy, id: @numberdetail
    end

    assert_redirected_to numberdetails_path
  end
end
