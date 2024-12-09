class Group < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages

  has_one :information, dependent: :destroy
  has_many :posts
end
