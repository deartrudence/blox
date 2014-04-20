require 'test_helper'

class BlocsControllerTest < ActionController::TestCase
  setup do
    @bloc = blocs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blocs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bloc" do
    assert_difference('Bloc.count') do
      post :create, bloc: { category: @bloc.category, code: @bloc.code, name: @bloc.name }
    end

    assert_redirected_to bloc_path(assigns(:bloc))
  end

  test "should show bloc" do
    get :show, id: @bloc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bloc
    assert_response :success
  end

  test "should update bloc" do
    patch :update, id: @bloc, bloc: { category: @bloc.category, code: @bloc.code, name: @bloc.name }
    assert_redirected_to bloc_path(assigns(:bloc))
  end

  test "should destroy bloc" do
    assert_difference('Bloc.count', -1) do
      delete :destroy, id: @bloc
    end

    assert_redirected_to blocs_path
  end
end
