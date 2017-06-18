# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Event.destroy_all
RegisteredApplication.destroy_all

10.times do
  RegisteredApplication.create!(
    name: Faker::Internet.domain_word,
    URL:  Faker::Internet.url
  )
end
registered_applications = RegisteredApplication.all


10.times do
  Event.create!(
  name: Faker::Internet.domain_word,
  registered_applications_id: registered_applications.pluck(:id).sample
  )
end

events = Event.all

puts "Seed Finished"
puts "#{Event.count} events created"
puts "#{RegisteredApplication.count} sites created"
