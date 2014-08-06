# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create roles
Role.create([{name: 'user'}, {name: 'admin'}])
# Create admin user
User.create(email: 'admin@reports.com', password: 'password', role_id: Role.find_by_name('admin').id)
