class AddGroupIdToInformation < ActiveRecord::Migration[8.0]
  def change
    add_column :information, :group_id, :integer
  end
end
