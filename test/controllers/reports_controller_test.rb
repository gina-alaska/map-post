require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  setup do
    @report = reports(:one)
    @user = users(:one)
    session[:user_id] = @user.id
  end

  test 'should get index' do
    get :index, event_id: @report.event_id
    assert_response :success
    assert_not_nil assigns(:reports)
  end

  test 'should get new' do
    get :new, event_id: events(:two)
    assert_response :success
  end

  test 'should create report' do
    assert_difference('Report.count') do
      post :create, event_id: @report.event_id, report: { event_id: @report.event_id, reason: @report.reason, user_id: @report.user_id }
    end

    assert_redirected_to assigns(:report).event
  end

  test 'should show report' do
    get :show, id: @report
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @report
    assert_response :success
  end

  test 'should update report' do
    patch :update, id: @report, report: { event_id: @report.event_id, reason: @report.reason, user_id: @report.user_id }
    assert_redirected_to assigns(:report).event
  end

  test 'should destroy report' do
    assert_difference('Report.count', -1) do
      delete :destroy, id: @report
    end

    assert_redirected_to @report.event
  end
end
