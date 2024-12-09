class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :camp_site_name
      t.string :camp_site_address
      t.string :camp_site_url
      t.string :text

      t.timestamps
    end
  end
end
