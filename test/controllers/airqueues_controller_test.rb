require 'test_helper'

class AirqueuesControllerTest < ActionController::TestCase
  setup do
    @airqueue = airqueues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:airqueues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create airqueue" do
    assert_difference('Airqueue.count') do
      post :create, airqueue: {  }
    end

    assert_redirected_to airqueue_path(assigns(:airqueue))
  end

  test "should show airqueue" do
    get :show, id: @airqueue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @airqueue
    assert_response :success
  end

  test "should update airqueue" do
    patch :update, id: @airqueue, airqueue: {  }
    assert_redirected_to airqueue_path(assigns(:airqueue))
  end

  test "should destroy airqueue" do
    assert_difference('Airqueue.count', -1) do
      delete :destroy, id: @airqueue
    end

    assert_redirected_to airqueues_path
  end
end
