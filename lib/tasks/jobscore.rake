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
    if company.job_score_feed.to_s.length >= 1
      companies_with_jobscore += 1

      feed_url = company.job_score_feed.to_s
      feed = Feedzirra::Feed.fetch_and_parse(feed_url)
      entries = feed.entries.sort {|a,b| b.published <=> a.published}
      entries.each do |job|
        if job.categories.second.to_s.include? 'NY'
          jobscore_jobs_checked += 1
          time = Time.now()
          title = job.title 
          date_posted = job.published
          description = job.content
          kind = job.categories.first 
          url = job.url
          job_in_db = Job.find(:all, :conditions => {:url => url})
          if job_in_db.count > 0
            job_id =  job_in_db.first.id
            in_db += 1
            p = Job.find(job_id)
            p.last_checked = time
            p.save!

          else
            not_in_db += 1
            Job.create ({
              :company_id => company.id,
              :title => title.to_s,
              :url => url.to_s,
              :last_checked => time, 
              :description => description.to_s,
              :date_posted => date_posted
           

            })
          end
        end
      end

         puts company.name 
    
    end
  end
  puts companies_checked.to_s + "Companies checked"
  puts companies_with_jobscore.to_s + "Companies with jobscore"
  puts jobscore_jobs_checked.to_s + " jobscore jobs Checked"

  puts in_db.to_s + " Jobs already in database"
  puts not_in_db.to_s + " new jobs"
end
