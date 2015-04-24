class CreateAircrafts < ActiveRecord::Migration
  def change
    create_table :aircrafts do |t|
      t.string :type
      t.string :size
      t.datetime :enqueued_at
      t.timestamps
    end
  end
end
