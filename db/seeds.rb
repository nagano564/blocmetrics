# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  RegisteredApplication.create!(
    name: Faker::Internet.domain_word,
    URL:  Faker::Internet.url
  )
end
registered_applications = RegisteredApplication.all

puts "Seed Finished"
puts "#{RegisteredApplication.count} posts created"
