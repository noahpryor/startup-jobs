class AddJobScoreFeedToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :job_score_feed, :string
  end
end
