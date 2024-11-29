class Group < ApplicationRecord
  has_many :users_groups
  has_many :users, through: :users_groups
  has_one :information, dependent: :destroy
end
