class RemoveGearTypeStringAndGearTypeFromGears < ActiveRecord::Migration[8.0]
  def up
    remove_column :gears, :gear_type_string, :string
    remove_column :gears, :gear_type, :string
  end

  def down
    add_column :gears, :gear_type_string, :string
    add_column :gears, :gear_type, :string
  end
end
