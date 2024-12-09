class UpdateVotingResultsJob < ApplicationJob
  queue_as :default

  def perform(group_id)
    group = Group.find(group_id)
    group.determine_top_voted_post if group.present?
  end
end
