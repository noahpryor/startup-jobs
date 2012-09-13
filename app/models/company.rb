class Company < ActiveRecord::Base
  has_many :jobs
  attr_accessible :category, :description, :employees, :founded, :funding, :jobs_url, :location, :name, :crunchbase_slug, :url, :image, :deadpooled_url, :funding_rounds, :overview, :twitter_username, :blog_url

#if Crunchbase::Company.find(name) 
         # company_crunchbase = Crunchbase::Company.find(name) 
         # if company_crunchbase.homepage_url
         # company_employees = company_crunchbase.homepage_url
        #else
        #  company_employeees = ""
       # end
       # else
      #    company_crunchbase = ""
       #   company_employees = ""
       # end

end
