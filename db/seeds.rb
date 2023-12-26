# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
p "Seeding departments"
  department_names= ["Operations", "IT", "Finance", "Service Center", "HR", "Supply Chain"]
  department_names.each do |department_name|
    department = Department.find_or_initialize_by(name: department_name)

  # Check if the department is a new record (not saved yet)
  if department.new_record?
    department.save!
    puts "Department '#{department_name}' created!"
  else
    puts "Department '#{department_name}' already exists!"
  end
  end

p "Finished seeding departments"

p "Seeding regions"
  region_names = [ "Dar Central", "Dar West", "Dar East", "Mwanza", "Mbeya"]

  region_names.each do |region_name|
    region = Region.find_or_initialize_by(name: region_name, department_id: Department.first.id)
    # Check if the department is a new record (not saved yet)
    if region.new_record?
      region.save!
      puts "region '#{region_name}' created!"
    else
      puts "region '#{region_name}' already exists!"
    end
  end

p "Finished seeding regions"
