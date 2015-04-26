require 'test_helper'

class AircraftTest < ActiveSupport::TestCase

  a  = Aircraft.create(size: "small", category: "passenger", enqueued_at: 0)
  a2 = Aircraft.create(size: "large", category: "cargo", enqueued_at: 20)
  a3 = Aircraft.create(size: "large", category: "cargo", enqueued_at: 10)

  test "enqueue sets correct airqueue id" do
    a.enqueue(123)
    assert_equal a.airqueue_id, 123
  end

  test "rating_for returns correct rating" do
    assert_equal a.rating_for(:size), 2
  end
end
