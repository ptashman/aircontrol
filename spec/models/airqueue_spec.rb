require 'rails_helper'

RSpec.describe Airqueue, type: :model do
  
  queue = Airqueue.create!
  ac1 = queue.aircrafts.create!(size: "small", category: "passenger", enqueued_at: Time.now)
  ac2 = queue.aircrafts.create!(size: "large", category: "cargo", enqueued_at: Time.now+2)
  ac3 = queue.aircrafts.create!(size: "large", category: "cargo", enqueued_at: Time.now+1)

  describe "dequeue_one" do
    it "should dequeue the correct aircrafts" do
      expect(queue.aircrafts).to include(ac1, ac2, ac3)
      queue.dequeue_one
      expect(queue.aircrafts).to_not include(ac1)
      queue.dequeue_one
      expect(queue.aircrafts).to_not include(ac3)
    end
  end
end