class Group < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages

  has_one :information, dependent: :destroy
end
