require 'test_helper'

class WebLayoutsControllerTest < ActionController::TestCase
  setup do
    @web_layout = web_layouts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:web_layouts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create web_layout" do
    assert_difference('WebLayout.count') do
      post :create, web_layout: { bloc_id: @web_layout.bloc_id, position: @web_layout.position, webpage_id: @web_layout.webpage_id }
    end

    assert_redirected_to web_layout_path(assigns(:web_layout))
  end

  test "should show web_layout" do
    get :show, id: @web_layout
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @web_layout
    assert_response :success
  end

  test "should update web_layout" do
    patch :update, id: @web_layout, web_layout: { bloc_id: @web_layout.bloc_id, position: @web_layout.position, webpage_id: @web_layout.webpage_id }
    assert_redirected_to web_layout_path(assigns(:web_layout))
  end

  test "should destroy web_layout" do
    assert_difference('WebLayout.count', -1) do
      delete :destroy, id: @web_layout
    end

    assert_redirected_to web_layouts_path
  end
end
