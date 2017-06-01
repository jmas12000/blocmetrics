5.times do
  User.create!(
    username:     Faker::Name.name,
    email:    Faker::Internet.unique.email,
    password: "111111",
    confirmed_at: Time.now
  )
end
users = User.all

15.times do
  RegisteredApplication.create!(
    name:         Faker::App.name,
    url:  Faker::Internet.url,
    user: users.sample
  )
end
registered_applications = RegisteredApplication.all


2000.times do
  Event.create!(
    registered_application:  registered_applications.sample,
    name: Faker::Hacker.verb,
    created_at: Faker::Date.between(7.days.ago, Date.today) 
  )
end



 
puts "Seed finished" 
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"
