class CreateUsersGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :users_groups do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.timestamps
    end
  end
end