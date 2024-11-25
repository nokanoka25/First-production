class RemoveGearTypeFromGears < ActiveRecord::Migration[8.0]
  def up
    remove_column :gears, :gear_type, :integer
      end

  def down
    add_column :gears, :gears, :gear_type, :integer
  end
end
