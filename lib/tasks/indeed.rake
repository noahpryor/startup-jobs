require 'open-uri'
require "nokogiri"
require 'indeed'
Indeed.key = 9573432793094543;

desc "indeed jobs"
task :indeed => [:environment] do
    total_indeed_jobs_new = 0
  total_indeed_jobs_checked = 0
  total_indeed_jobs = total_indeed_jobs_new + total_indeed_jobs_checked
  companies_with_indeed = 0

  companies = Company.all
  companies.each do |company|
    if company.resumator_feed.to_s.length == 0 && company.job_score_feed.to_s.length == 0 && company.name.length >=1
      company_name = company.name.to_s
      if company_name
      else company_name = "fawefaw3rfq2"
      end
      company_joined = "company:" + company_name
      zipcode = "10003"
      radius = "50"
      puts  company.name + "- indeed"
      source = "indeed"
          companies_with_indeed += 1
            indeed_jobs_new_company = 0
      indeed_jobs_old_company = 0

      result = Indeed.search(:q =>  company_joined, :l => zipcode, :sort => "date", :radius => radius, :st => "employer", :limit => "500", :fromage => '30')
      indeedjobs  =  JSON.parse(result.to_json)  #indeed returns number of results
      #puts Indeed.get('7a1f8394a31bffeb').to_s
    #  puts result
      indeedjobs.each do |job|
        title = job["jobtitle"]
        description =  job["snippet"]
        url =  job["url"]
        date_posted = job["date"]
        time = Time.now()
        source_unique_id = job["jobkey"]
        job_in_db = Job.find(:all, :conditions => {:sorce_unique_id => source_unique_id})
          
          if job_in_db.count > 0
            
            job_id =  job_in_db.first.id
            p = Job.find(job_id)
            p.source = source
            p.sorce_unique_id = source_unique_id
            p.last_checked = time
            p.save!
            indeed_jobs_old_company += 1

          else

                indeed_jobs_new_company += 1
      #      puts title
       #     puts description
        #    puts url
         #   puts date_posted
          #  puts time
          end
      end
    end
   #  total_indeed_jobs_new += indeed_jobs_new_company
    #  total_indeed_jobs_checked += indeed_jobs_old_company
      puts "new: " + indeed_jobs_new_company.to_s
      puts "verified: " + indeed_jobs_old_company.to_s

  end
  puts "indeed -  New jobs: "+total_indeed_jobs_new.to_s + " Checked jobs:" + total_indeed_jobs_checked.to_s
  # dputs "companies with indeed"+companies_with_indeed.to_s

end
