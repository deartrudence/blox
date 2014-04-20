require 'test_helper'

class WebpagesControllerTest < ActionController::TestCase
  setup do
    @webpage = webpages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:webpages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create webpage" do
    assert_difference('Webpage.count') do
      post :create, webpage: { bloc_id: @webpage.bloc_id, name: @webpage.name }
    end

    assert_redirected_to webpage_path(assigns(:webpage))
  end

  test "should show webpage" do
    get :show, id: @webpage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @webpage
    assert_response :success
  end

  test "should update webpage" do
    patch :update, id: @webpage, webpage: { bloc_id: @webpage.bloc_id, name: @webpage.name }
    assert_redirected_to webpage_path(assigns(:webpage))
  end

  test "should destroy webpage" do
    assert_difference('Webpage.count', -1) do
      delete :destroy, id: @webpage
    end

    assert_redirected_to webpages_path
  end
end
