class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  has_many :users_gears, dependent: :destroy
  has_many :gears, through: :users_gears
  has_many :groups, through: :messages
  has_many :messages, dependent: :destroy  
  has_many :votes, dependent: :destroy

end
