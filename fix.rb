diff --git a/app/models/address.rb b/app/models/address.rb
index a19addc..f23c6fc 100644
--- a/app/models/address.rb
+++ b/app/models/address.rb
@@ -1,2 +1,4 @@
 class Address < ApplicationRecord
+  has_one :organization
+  has_one :person
 end
diff --git a/app/models/organization.rb b/app/models/organization.rb
index c50f754..e629300 100644
--- a/app/models/organization.rb
+++ b/app/models/organization.rb
@@ -1,4 +1,4 @@
 class Organization < ApplicationRecord
-  has_one :address
+  belongs_to :address, optional: true
   has_many :people
 end
diff --git a/app/models/person.rb b/app/models/person.rb
index 06fcbaa..ad2097c 100644
--- a/app/models/person.rb
+++ b/app/models/person.rb
@@ -1,4 +1,4 @@
 class Person < ApplicationRecord
-  has_one :address
+  belongs_to :address, optional: true
   belongs_to :organization
 end
diff --git a/db/seeds.rb b/db/seeds.rb
index 37d581f..649db3d 100644
--- a/db/seeds.rb
+++ b/db/seeds.rb
@@ -3,23 +3,31 @@ require 'csv'
 csv_text = File.read(Rails.root.join('lib', 'seeds', 'crm1.csv'))
 csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
 csv.each do |row|
+  o = Organization.find_or_create_by(organization_name: row['organization_name'])
+  o.domain = row['domain']
+  o.organization_phone = row['organization_phone']
+  o.save!
+  puts "#{o.organization_name} saved"
+
   p = Person.new
   p.name = row['name']
   p.job_title = row['job_title']
   p.email_address = row['email_address']
   p.phone = row['phone']
-  p.save
+  p.organization = o
+  p.save!
   puts "#{p.name} saved"
-end
 
-csv.each do |row|
-  o = Organization.new
-  o.organization_name = row['organization_name']
-  o.domain = row['domain']
-  o.organization_phone = row['organization_phone']
-  o.people_count = row['people_count']
-  o.save
-  puts "#{o.organization_name} saved"
+  if row['street'] && row['city'] && row['state'] && row['zip']
+    address = Address.find_or_create_by!(
+      street: row['street'],
+      city: row['city'],
+      state: row['state'],
+      zip: row['zip']
+    )
+    o.update(address: address)
+    p.update(address: address)
+  end
 end
 
 puts "There are now #{Organization.count} rows in the Organization table"
