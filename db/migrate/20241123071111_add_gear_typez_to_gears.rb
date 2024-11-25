class AddGearTypezToGears < ActiveRecord::Migration[8.0]
  def change
    add_column :gears, :gear_type, :integer, null: false, default: 0
  end
end
