namespace :db do
  
  desc "Erase and fill database"
  
  task :populate => :environment do
    
    require 'populator'
    require 'faker'
    
    [User, Role, Report].each(&:delete_all)

    # Create roles    
    Role.create([{name: 'user'}, {name: 'admin'}])
    # Create admin user
    User.create(email: 'admin@reports.com', password: 'password', role: Role.find_by_name('admin'))
    # Create main simple user
    User.create(email: 'user@reports.com', password: 'password', role: Role.find_by_name('user'))

    # Create more simple users with reports
    50.times do
      user = User.create(email: Faker::Internet.email, password: 'password', role: Role.find_by_name('user'))
      Report.populate 2..20 do |report|
        report.width = 1..1000
        report.height = 1..1000
        report.cost = 1..1000
        report.comment = Faker::Lorem.sentence(3)
        report.user_id = user.id
      end
    end

  end
end