# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

10.times do |i|
  city = City.create!(
    name: Faker::Address.city)
  puts "*"*(i+1)
  puts "#{i+1} city(s) created"
end

10.times do |i|
  doctor = Doctor.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    zip_code: Faker::Address.zip_code,
    specialty: ["dentist", "surgeon", "cardiologist", "ophtamologist", "family doctor", "pediatrician", "dermatologist"].sample,
    city: City.all.sample)
    puts "*"*(i+1)
    puts "#{i+1} doctor(s) created"
end

20.times do |i|
  patient = Patient.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: City.all.sample)
    puts "*"*(i+1)
    puts "#{i+1} patient(s) created"
end

30.times do |i|
  doc = Doctor.all.sample
  appointment = Appointment.create!(doctor:doc, patient:Patient.all.sample, city:doc.city)
  puts "*"*(i+1)
  puts "#{i+1} doc(s) created"
end