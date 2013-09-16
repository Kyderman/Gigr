# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin
user2 = User.find_or_create_by_email :name => 'Musician User', :email => 'user2@example.com', :password => 'changeme', :password_confirmation => 'changeme'
user2.add_role :musician
user2.create_user_type
user3 = User.find_or_create_by_email :name => 'Band User', :email => 'user3@example.com', :password => 'changeme', :password_confirmation => 'changeme'
user3.add_role :band
user3.create_user_type
user4 = User.find_or_create_by_email :name => 'Venue User', :email => 'user4@example.com', :password => 'changeme', :password_confirmation => 'changeme'
user4.add_role :venue
user4.create_user_type

puts "users: #{user2.name}, #{user3.name}, #{user4.name}"

puts 'INSTRUMENTS'
ins1 = Instrument.create(name: "Vocals")
ins2 = Instrument.create(name: "Drums")
ins3 = Instrument.create(name: "Guitar")
ins4 = Instrument.create(name: "Bass")
ins5 = Instrument.create(name: "Lighting")
ins6 = Instrument.create(name: "Sound Technician")

puts 'MUSICIANS'
mus1 = Musician.create(name: "Ryan Inglis")
mus1.instruments << ins3
mus1.instruments << ins1
mus2 = Musician.create(name: "Peter Fealey")
mus2.instruments << ins4
mus3 = Musician.create(name: "Rob Whelan")
mus3.instruments << ins2
mus4 = Musician.create(name: "Tom Forrester")
mus4.instruments << ins1



