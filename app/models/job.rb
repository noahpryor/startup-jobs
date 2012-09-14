class Job < ActiveRecord::Base
  belongs_to :company
  attr_accessible :company_id, :date_posted, :dated_updated, :internship, :technical, :title, :url, :description, :last_checked, :experience_required, :kind, :id, :sorce_unique_id, :source
end
