require 'open-uri'
require "nokogiri"

desc " resumator jobs"
task :resumator => [:environment] do
  companies_checked = 0
  companies_with_resumator = 0
  resumator_jobs_checked = 0
  in_db = 0
  not_in_db = 0
  companies = Company.all 
  companies.each do |company|
    companies_checked +=1
    if company.resumator_feed.to_s.length >= 1
      companies_with_resumator += 1

      resumator_feed = company.resumator_feed.to_s
      doc = Nokogiri::XML(open(resumator_feed))
      resumator_jobs = doc.xpath("//job") 
      resumator_jobs.each do |job|
        resumator_jobs_checked += 1
        time = Time.now()
        title = job.xpath("title").inner_text 
        description = job.xpath("description").inner_text 
        kind = job.xpath("type").inner_text 
        experience_required = job.xpath("experience").inner_text
        url = job.xpath("url").inner_text
        city = job.xpath("city").inner_text
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
            :experience_required => experience_required

         

          })
        end
      end

         puts company.name 
    
    end
  end
  puts companies_checked.to_s + "Companies checked"
  puts companies_with_resumator.to_s + "Companies with Resumator"
  puts resumator_jobs_checked.to_s + " Resumator jobs Checked"

  puts in_db.to_s + " Jobs already in database"
  puts not_in_db.to_s + " new jobs"
end
