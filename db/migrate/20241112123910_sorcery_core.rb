class SorceryCore < ActiveRecord::Migration[8.0]
  def change
    unless table_exists?(:users)
      create_table :users do |t|
        t.string :email, null: false, index: { unique: true }
        t.string :crypted_password
        t.string :salt

        t.timestamps
      end
      add_index :users, :email, unique: true
    end
  end
end
