require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  setup do
    @group = groups(:one)
    @user = users(:one)
    session[:user_id] = @user.id
  end

  test 'should recognize groups api route' do
    assert_recognizes({ controller: 'groups', action: 'index', format: 'json'}, "/groups.json")
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group" do
    assert_difference('Group.count') do
      post :create, group: { description: @group.description, name: @group.name + ' new name', acronym: @group.acronym, restricted: @group.restricted, visible: @group.visible }
    end

    assert_redirected_to group_path(assigns(:group))
  end

  test "should show group" do
    get :show, id: @group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group
    assert_response :success
  end

  test "should update group" do
    patch :update, id: @group, group: { description: @group.description, name: @group.name, restricted: @group.restricted, visible: @group.visible }
    assert_redirected_to group_path(assigns(:group))
  end

  test "should fail to update group they don't own" do
    session[:user_id] = users(:two)
    group = groups(:one)
    patch :update, id: group, group: { description: group.description, name: group.name, restricted: group.restricted, visible: group.visible }
    assert_equal 'You are not authorized to access this page.', flash[:alert]
    assert_redirected_to root_path
  end

  test "should destroy group" do
    assert_difference('Group.count', -1) do
      delete :destroy, id: @group
    end

    assert_redirected_to groups_path
  end
end
