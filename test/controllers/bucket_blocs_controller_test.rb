require 'test_helper'

class BucketBlocsControllerTest < ActionController::TestCase
  setup do
    @bucket_bloc = bucket_blocs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bucket_blocs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bucket_bloc" do
    assert_difference('BucketBloc.count') do
      post :create, bucket_bloc: { bloc_id: @bucket_bloc.bloc_id, user_id: @bucket_bloc.user_id }
    end

    assert_redirected_to bucket_bloc_path(assigns(:bucket_bloc))
  end

  test "should show bucket_bloc" do
    get :show, id: @bucket_bloc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bucket_bloc
    assert_response :success
  end

  test "should update bucket_bloc" do
    patch :update, id: @bucket_bloc, bucket_bloc: { bloc_id: @bucket_bloc.bloc_id, user_id: @bucket_bloc.user_id }
    assert_redirected_to bucket_bloc_path(assigns(:bucket_bloc))
  end

  test "should destroy bucket_bloc" do
    assert_difference('BucketBloc.count', -1) do
      delete :destroy, id: @bucket_bloc
    end

    assert_redirected_to bucket_blocs_path
  end
end
