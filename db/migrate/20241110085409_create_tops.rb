class CreateTops < ActiveRecord::Migration[8.0]
  def change
    create_table :tops do |t|
      t.string :name

      t.timestamps
    end
  end
end