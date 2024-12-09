class Group < ApplicationRecord
  after_update :schedule_voting_result_job, if: :voting_end_at_changed?

  has_many :messages
  has_many :users, through: :messages

  has_one :information, dependent: :destroy
  has_many :posts
  belongs_to :top_voted_post, class_name: 'Post', optional: true

  validates :voting_start_at, presence: true
  validates :voting_end_at, presence: true
  validate :voting_dates_are_valid

  def voting_active?
    return false if voting_start_at.nil? || voting_end_at.nil?

    Time.current.between?(voting_start_at, voting_end_at)
  end

  def determine_top_voted_post
    top_post = posts.includes(:votes).max_by { |post| post.votes.count }
    update(top_voted_post: top_post)
  end

  private

  def voting_dates_are_valid
    if voting_start_at.present? && voting_end_at.present? && voting_start_at >= voting_end_at
      errors.add(:voting_end_at, "は開始日時より後に設定してください")
    end
  end

  def schedule_voting_result_job
    return unless voting_end_at.present?

    UpdateVotingResultsJob.set(wait_until: voting_end_at).perform_later(id)
  end
end

