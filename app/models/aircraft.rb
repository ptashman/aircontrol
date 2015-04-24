class Aircraft < ActiveRecord::Base
  validates :type, :size, presence: true

  belongs_to :airqueue

  def enqueue(airqueue_id)
    self.airqueue_id = airqueue_id
    self.enqueued_at = Time.now
  end

  def passenger_rating
    1
  end

  def cargo_rating
    2
  end

  def large_rating
    1
  end

  def small_rating
    2
  end

  def rating_for(attr_name)
    attr_value_str = send(attr_name)
    send("#{attr_value_str.downcase}_rating".to_sym)
  end

  def self.sort_by_expendability
    units = self.all
    attributes = [:type, :size]
    attributes.each { |a| units.sort! { |x,y| x.rating_for(a) <=> y.rating_for(a) } }
    units.sort! { |x,y| x.enqueued_at <=> y.enqueued_at }
  end
end
