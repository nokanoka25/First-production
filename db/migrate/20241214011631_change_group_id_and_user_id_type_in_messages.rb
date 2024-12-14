class ChangeGroupIdAndUserIdTypeInMessages < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :messages, :groups, if_exists: true
    remove_foreign_key :messages, :users, if_exists: true

    change_column :messages, :group_id, :bigint
    change_column :messages, :user_id, :bigint

    add_foreign_key :messages, :groups
    add_foreign_key :messages, :users

  end
end
