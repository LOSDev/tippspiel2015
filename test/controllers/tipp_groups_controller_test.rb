require 'test_helper'

class TippGroupsControllerTest < ActionController::TestCase
  setup do
    @tipp_group = tipp_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipp_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipp_group" do
    assert_difference('TippGroup.count') do
      post :create, tipp_group: { name: @tipp_group.name, password: @tipp_group.password, user_id: @tipp_group.user_id }
    end

    assert_redirected_to tipp_group_path(assigns(:tipp_group))
  end

  test "should show tipp_group" do
    get :show, id: @tipp_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipp_group
    assert_response :success
  end

  test "should update tipp_group" do
    patch :update, id: @tipp_group, tipp_group: { name: @tipp_group.name, password: @tipp_group.password, user_id: @tipp_group.user_id }
    assert_redirected_to tipp_group_path(assigns(:tipp_group))
  end

  test "should destroy tipp_group" do
    assert_difference('TippGroup.count', -1) do
      delete :destroy, id: @tipp_group
    end

    assert_redirected_to tipp_groups_path
  end
end
