class Aircraft < ActiveRecord::Base
  validates_inclusion_of :category, :in => ["passenger", "cargo"]
  validates_inclusion_of :size, :in => ["large", "small"]

  belongs_to :airqueue

  PASSENGER_RATING = 1
  CARGO_RATING     = 2

  LARGE_RATING     = 1
  SMALL_RATING     = 2

  def enqueue(airqueue_id)
    self.airqueue_id = airqueue_id
    self.enqueued_at = Time.now
    save
  end

  def dequeue
    self.airqueue_id = self.enqueued_at = nil
    save
  end

  def rating_for(attr_sym)
    attr_value_str = send(attr_sym)
    "Aircraft::#{attr_value_str.upcase}_RATING".constantize
  end
end
