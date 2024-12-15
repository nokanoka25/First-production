class UpdateVotingResultsJob < ApplicationJob
  queue_as :default

  def perform(group_id)
    users_group = UsersGroup.find(users_group_id)
    group.determine_top_voted_post if group.present?
  end
end
