class Post < ApplicationRecord
  belongs_to :group
  has_many :votes, dependent: :destroy
end
