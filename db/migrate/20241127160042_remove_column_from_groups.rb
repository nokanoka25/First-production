class RemoveColumnFromGroups < ActiveRecord::Migration[8.0]
  def up
    remove_column :groups, :start_day
    remove_column :groups, :finish_day
    remove_column :groups, :camp_site_name
    remove_column :groups, :camp_site_address
    remove_column :groups, :camp_site_url
    remove_column :groups, :car, :integer
    remove_column :groups, :start_point
    remove_column :groups, :check_in
    remove_column :groups, :check_out
      end

  def down
    add_column :groups, :start_day, :date
    add_column :groups, :finish_day, :date
    add_column :groups, :camp_site_name, :string
    add_column :groups, :camp_site_address, :string
    add_column :groups, :camp_site_url, :string
    add_column :groups, :car, :integer
    add_column :groups, :start_point, :string
    add_column :groups, :check_in, :datetime
    add_column :groups, :check_out, :datetime
  end
end
