class ChangeUsersGroupsToMessages < ActiveRecord::Migration[8.0]
  def change
    rename_table :users_groups, :messages
  end
end
