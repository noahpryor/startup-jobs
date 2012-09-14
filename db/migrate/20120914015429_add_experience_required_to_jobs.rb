class AddExperienceRequiredToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :experience_required, :string
  end
end
