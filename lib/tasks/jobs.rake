require 'open-uri'
require "nokogiri"

desc " resumator jobs"
task :resumator => [:environment] do
 doc = Nokogiri::XML(open("http://app.theresumator.com/feeds/export/jobs/ycharts"))
 resumator_jobs = doc.xpath("//job") 
  #doc.xpath("//job") 
  resumator_jobs.each do |job|
  puts job.xpath("title").inner_text 
  puts job.xpath("description").inner_text 
  puts job.xpath("type").inner_text 
  puts job.xpath("experience").inner_text
  puts job.xpath("url").inner_text
  puts job.xpath("city").inner_text

end
end
