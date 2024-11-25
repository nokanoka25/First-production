class AddColumnGears < ActiveRecord::Migration[8.0]
  def change
    add_column :gears, :gears_type, :integer
  end
end
