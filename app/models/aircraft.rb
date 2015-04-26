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
  end

  def rating_for(attr_sym)
    attr_value_str = send(attr_sym)
    "Aircraft::#{attr_value_str.upcase}_RATING".constantize
  end

  def self.sort_by_expendability
    by_category = self.all.sort { |x,y| x.rating_for(:category) <=> y.rating_for(:category) }
    by_size = sort_in_groups(by_category, :category, :rating_for, [:size])
    sort_in_nestings(by_size, [:category, :size], :enqueued_at)
  end

private

  def self.sort_in_groups(collection, group_sym, attr_sym, params = [])
    sorted = []
    collection.group_by { |a| a.send(group_sym) }.each do |k,v|
      sorted << v.sort { |x,y| x.send(attr_sym, *params) <=> y.send(attr_sym, *params) }
    end
    sorted.flatten
  end

  def self.sort_in_nestings(collection, group_symbols, attr_sym, params = [])
    sorted = []
    collection.group_by { |a| a.send(group_symbols[0]) }.each do |k,v|
      sorted << sort_in_groups(v, group_symbols[1], attr_sym, params = [])
    end
    sorted.flatten
  end
end
