class AddGroupIdUserIdAndContentToMessages < ActiveRecord::Migration[8.0]
  def change
    add_column :messages, :group_id, :integer
    add_column :messages, :user_id, :integer
    add_column :messages, :content, :text
  end
end
