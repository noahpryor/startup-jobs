class Job < ActiveRecord::Base
  belongs_to :company
  attr_accessible :company_id, :date_posted, :dated_updated, :internship, :technical, :title, :url
end
