class AddVotingPeriodAndResultToGroups < ActiveRecord::Migration[8.0]
  def change
    add_column :groups, :voting_start_at, :datetime
    add_column :groups, :voting_end_at, :datetime
    add_column :groups, :top_voted_post_id, :integer
  end
end
