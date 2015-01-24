require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
    @user = users(:one)
    session[:user_id] = @user.id
  end

  test 'should recognize events api route' do
    assert_recognizes({ controller: 'events', action: 'index', format: 'json'}, "/events.json")
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get index.geojson" do
    get :index, format: :geojson, visible: true
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { description: @event.description, starts_at: @event.starts_at, ends_at: @event.ends_at, group_id: @event.group_id, title: @event.title, user_id: @event.user_id, visible: @event.visible }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    patch :update, id: @event, event: { description: @event.description, event_at: @event.event_at, group_id: @event.group_id, title: @event.title, visible: @event.visible }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should fail to update event they don't own" do
    session[:user_id] = users(:two)
    event = events(:two)
    patch :update, id: event, event: { description: event.description, event_at: event.event_at, group_id: event.group_id, title: event.title, visible: event.visible }
    assert_equal 'You are not authorized to access this page.', flash[:alert]
    assert_redirected_to root_path
  end

  test "a normal user should be able to update event they own" do
    session[:user_id] = users(:two)
    event = events(:three)
    patch :update, id: event, event: { description: event.description, event_at: event.event_at, group_id: event.group_id, title: event.title, visible: event.visible }
    assert_equal 'Post was successfully updated.', flash[:notice]
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
