class Gear < ApplicationRecord
  has_many :users_gears, dependent: :destroy
  has_many :users, through: :users_gears
  has_many :my_gears, dependent: :destroy
  has_many :users, through: :my_gears

end
