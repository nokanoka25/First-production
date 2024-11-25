class AddGearTypeToGears < ActiveRecord::Migration[8.0]
  def change
    add_column :gears, :gear_type, :string, null: false
  end
end
