class CreateInformation < ActiveRecord::Migration[8.0]
  def change
    create_table :information do |t|
      t.date :start_day
      t.date :finish_day
      t.string :camp_site_name
      t.string :camp_site_address
      t.string :camp_site_url
      t.integer :car
      t.string :start_point
      t.datetime :check_in
      t.datetime :check_out
      t.timestamps
    end
  end
end
