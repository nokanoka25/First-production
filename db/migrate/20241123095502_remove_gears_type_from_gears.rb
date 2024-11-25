class RemoveGearsTypeFromGears < ActiveRecord::Migration[8.0]
  def up
    remove_column :gears, :gears_type
      end

  def down
    add_column :gears, :gears_type, :string
  end
end
