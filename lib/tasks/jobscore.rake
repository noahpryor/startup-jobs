require 'open-uri'
require "nokogiri"
require 'feedzirra'
desc " jobscore jobs"
task :jobscore => [:environment] do
  companies_checked = 0
  companies_with_jobscore = 0
  jobscore_jobs_checked = 0
  in_db = 0
  not_in_db = 0
  companies = Company.all 
  companies.each do |company|
    companies_checked +=1
    if v
         puts company.name 
    
    end
  end
  puts companies_checked.to_s + "Companies checked"
  puts companies_with_jobscore.to_s + "Companies with jobscore"
  puts jobscore_jobs_checked.to_s + " jobscore jobs Checked"

  puts in_db.to_s + " Jobs already in database"
  puts not_in_db.to_s + " new jobs"
end
