class AddColumnToInformation < ActiveRecord::Migration[8.0]
  def change
    add_column :information, :latitude, :float
    add_column :information, :longitude, :float
  end
end
