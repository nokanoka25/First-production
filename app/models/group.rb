class Group < ApplicationRecord
  has_many :users_groups
  has_many :users, through: :users_groups
  before_create :generate_unique_token
  has_many :messages


  has_one :information, dependent: :destroy
  has_many :posts
  belongs_to :top_voted_post, class_name: "Post", optional: true

  validate :voting_dates_are_valid
  has_many :my_gears
  has_many :schedules, dependent: :destroy

  def voting_active?
    return false if voting_start_at.nil? || voting_end_at.nil?

    Time.current.between?(voting_start_at, voting_end_at)
  end

  def determine_top_voted_post
    top_post = posts.includes(:votes).max_by { |post| post.votes.count }
    update(top_voted_post: top_post)
  end

  def voting_dates_are_valid
    if voting_start_at.present? && voting_end_at.present? && voting_start_at >= voting_end_at
      errors.add(:voting_end_at, "は開始日時より後に設定してください")
    end
  end


  def schedule_voting_result_job
    Rails.logger.info "Debug: schedule_voting_result_job triggered for Group ID #{id}"
    if saved_change_to_voting_end_at?
      Rails.logger.info "Debug: voting_end_at was changed for Group ID #{id}"
    else
      Rails.logger.info "Debug: voting_end_at was NOT changed for Group ID #{id}"
    end

    return unless voting_end_at.present?
    utc_time = voting_end_at.utc
    Rails.logger.info "Debug: Scheduling UpdateVotingResultsJob for Group ID #{id} at #{utc_time} (UTC)"
    UpdateVotingResultsJob.set(wait_until: voting_end_at).perform_later(id)
  end

  private

  def generate_unique_token
    loop do
      self.token = SecureRandom.hex(6) # 6桁のランダムな16進数を生成
      break unless Group.exists?(token: token)
    end
  end
end
