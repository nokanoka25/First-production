class RenameMessagesToUsersGroups < ActiveRecord::Migration[8.0]
  def change
    rename_table :messages, :users_groups
  end
end
