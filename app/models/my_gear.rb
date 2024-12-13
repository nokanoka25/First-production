class MyGear < ApplicationRecord
  belongs_to :user
  belongs_to :gear
  belongs_to :group
end
