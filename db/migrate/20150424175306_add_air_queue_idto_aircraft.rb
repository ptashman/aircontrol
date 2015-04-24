class AddAirQueueIdtoAircraft < ActiveRecord::Migration
  def change
    add_column :aircrafts, :airqueue_id, :integer
  end
end
