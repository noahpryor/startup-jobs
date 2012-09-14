class AddDescriptionRequiredToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :description, :text
    add_column :jobs, :last_checked, :datetime
  end
end
