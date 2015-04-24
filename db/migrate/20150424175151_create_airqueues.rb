class CreateAirqueues < ActiveRecord::Migration
  def change
    create_table :airqueues do |t|

      t.timestamps
    end
  end
end
