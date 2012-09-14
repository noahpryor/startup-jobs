class AddResumatorFeedToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :resumator_feed, :string
  end
end
