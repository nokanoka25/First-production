class CreateGears < ActiveRecord::Migration[8.0]
  def change
    create_table :gears do |t|
      t.string :gear_type
      t.string :name
      t.integer :length
      t.integer :width
      t.timestamps
    end
  end
end
