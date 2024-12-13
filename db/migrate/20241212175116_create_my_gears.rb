class CreateMyGears < ActiveRecord::Migration[8.0]
  def change
    create_table :my_gears do |t|
      t.references :user, null: false, foreign_key: true
      t.references :gear, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
