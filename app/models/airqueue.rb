class Airqueue < ActiveRecord::Base
  has_many :aircrafts

  def dequeue_one
    sorted_aircrafts.first.try(:dequeue)
    reload
  end

private

  def sorted_aircrafts
    by_category = aircrafts.sort { |x,y| x.rating_for(:category) <=> y.rating_for(:category) }
    by_size = sorted_in_groups(by_category, :category, :rating_for, [:size])
    sorted_in_nestings(by_size, [:category, :size], :enqueued_at)
  end

  def sorted_in_groups(collection, group_sym, attr_sym, params = [])
    sorted = []
    collection.group_by { |a| a.send(group_sym) }.each do |k,v|
      sorted << v.sort { |x,y| x.send(attr_sym, *params) <=> y.send(attr_sym, *params) }
    end
    sorted.flatten
  end

  def sorted_in_nestings(collection, group_symbols, attr_sym, params = [])
    sorted = []
    collection.group_by { |a| a.send(group_symbols[0]) }.each do |k,v|
      sorted << sorted_in_groups(v, group_symbols[1], attr_sym, params = [])
    end
    sorted.flatten
  end
end
