class RenameAircraftTypeToCategory < ActiveRecord::Migration
  def change
    rename_column :aircrafts, :type, :category
  end
end
