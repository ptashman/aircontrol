require 'rails_helper'

RSpec.describe Aircraft, type: :model do
  
  let(:a) { Aircraft.create(size: "small", category: "passenger", enqueued_at: 0) }

  describe "enqueue" do
    it "should set correct airqueue id" do
      a.enqueue(123)
      expect(a.airqueue_id).to be(123)
    end
  end

  describe "rating_for" do
    it "should return the correct rating for size" do
      expect(a.rating_for(:size)).to be(Aircraft::SMALL_RATING)
    end

    it "should return the correct rating for size" do
      expect(a.rating_for(:category)).to be(Aircraft::PASSENGER_RATING)
    end
  end
end