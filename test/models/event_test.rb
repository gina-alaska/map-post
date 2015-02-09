require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @event = events(:one)
  end

  test 'should return a wkt string from location' do
    assert_match 'POINT(-147.83421993255615 64.85809028478076)', @event.location.as_ewkt
  end

  test 'should not be visible if 3 or more reports' do
    event = events(:reported)

    assert event.reports.count >= 3, 'needs 3 or more reports'
    refute event.visible?, 'was still visible'
  end

  test 'should not fetch event with more than 3 reports' do
    refute Event.visible.include?(events(:reported)), 'Found reported event'
  end

  test 'should report hidden reason for reports' do
    assert_equal 'Reported 3 times', events(:reported).hidden_reason
  end
end
