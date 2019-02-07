require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'crm1.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  p = Person.new
  p.name = row['name']
  p.job_title = row['job_title']
  p.email_address = row['email_address']
  p.phone = row['phone']
  p.save
  puts "#{p.name} saved"
end

csv.each do |row|
  o = Organization.new
  o.organization_name = row['organization_name']
  o.domain = row['domain']
  o.organization_phone = row['organization_phone']
  o.people_count = row['people_count']
  o.save
  puts "#{o.organization_name} saved"
end

puts "There are now #{Organization.count} rows in the Organization table"
