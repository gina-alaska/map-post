require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @event = events(:one)
  end

  test "should return a wkt string from location" do
    assert_match "POINT(-147.83421993255615 64.85809028478076)", @event.location.as_ewkt
  end
end
