class Company < ActiveRecord::Base
  has_many :jobs
  attr_accessible :category, :description, :employees, :founded, :funding, :jobs_url, :location, :name, :url
end
