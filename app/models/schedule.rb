class Schedule < ApplicationRecord
  belongs_to :group

  validates :name, presence: true
  validates :scheduled_at, presence: true
end
