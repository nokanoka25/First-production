class CreateSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :schedules do |t|
      t.string :name
      t.datetime :scheduled_at
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
