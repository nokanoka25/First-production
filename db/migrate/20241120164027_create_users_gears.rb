class CreateUsersGears < ActiveRecord::Migration[8.0]
  def change
    create_table :users_gears do |t|
      t.references :user, foreign_key: true
      t.references :gear, foreign_key: true
      
      t.timestamps
    end
    add_index :users_gears, [:user_id, :gear_id], unique: true
  end
end
