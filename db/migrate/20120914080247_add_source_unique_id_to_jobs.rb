class AddSourceUniqueIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :sorce_unique_id, :string
  end
end
