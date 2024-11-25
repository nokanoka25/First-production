class UsersGear < ApplicationRecord
  belongs_to :user
  belongs_to :gear

  validates :user_id, uniqueness: { scope: :gear_id }
end
