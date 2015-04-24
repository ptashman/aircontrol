class Aircraft < ActiveRecord::Base
  validates :type, :size, presence: true

  belongs_to :airqueue

  def enqueue(airqueue_id)
    self.airqueue_id = airqueue_id
    self.enqueued_at = Time.now
  end

#  def self.sort_by_expenability
#    self.all
end
