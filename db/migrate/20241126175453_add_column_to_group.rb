class AddColumnToGroup < ActiveRecord::Migration[8.0]
  def change
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
