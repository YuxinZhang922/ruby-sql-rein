# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Contact.destroy_all
# **************************

# - Insert and read contact data for companies in the database
puts "There are #{Company.all.count} companies"
puts "There are #{Contact.all.count} contacts"

# 1. insert new rows in the contacts table with relationship to a company
contact = Contact.new
contact["first_name"] = "Tin"
contact["last_name"] = "Cook"
contact["email"] = "tin@apple.com"
contact["company_id"] = Company.find_by({"name"=>"Apple"})["id"]
contact.save

contact = Contact.new
contact["first_name"] = "Craig"
contact["last_name"] = "Federeighi"
contact["email"] = "craig@apple.com"
contact["company_id"] = Company.find_by({"name"=>"Apple"})["id"]
contact.save

amazon = Company.find_by({"name"=>"Amazon"})
contact = Contact.new
contact["first_name"] = "Jeff"
contact["last_name"] = "Bezos"
contact["email"] = "jeff@amazon.com"
contact["company_id"] = amazon["id"]
contact.save

# 2. How many contacts work at Apple?
apple_contacts = Contact.where({"company_id" => Company.find_by({"name"=>"Apple"})["id"]})
p apple_contacts
# 3. What is the full name of each contact who works at Apple?
for people in apple_contacts
  first_name = people["first_name"]
  last_name = people["last_name"]
  p "#{first_name} #{last_name}"
end