class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :user_id, uniqueness: { scope: :group_id }
  validates :content, presence: true
  after_create_commit { MessageBroadcastJob.perform_later self }
end
