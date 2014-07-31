require 'test_helper'

class KeepsControllerTest < ActionController::TestCase
  setup do
    @keep = keeps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:keeps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create keep" do
    assert_difference('Keep.count') do
      post :create, keep: { content: @keep.content }
    end

    assert_redirected_to keep_path(assigns(:keep))
  end

  test "should show keep" do
    get :show, id: @keep
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @keep
    assert_response :success
  end

  test "should update keep" do
    patch :update, id: @keep, keep: { content: @keep.content }
    assert_redirected_to keep_path(assigns(:keep))
  end

  test "should destroy keep" do
    assert_difference('Keep.count', -1) do
      delete :destroy, id: @keep
    end

    assert_redirected_to keeps_path
  end
end
