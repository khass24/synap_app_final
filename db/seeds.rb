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
  p = Person.new
  p.name = row['name']
  p.job_title = row['job_title']
  p.email_address = row['email_address']
  p.phone = row['phone']
  p.save
  puts "#{p.name} saved"
end

puts "There are now #{Person.count} rows in the Person table"
