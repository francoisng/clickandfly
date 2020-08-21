# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Airplane.destroy_all
User.destroy_all

User.create!(email: "mikail@gmail.com", password: "mikail")
# user1.save!
User.create!(email: "francois@gmail.com", password: "francois")
User.create!(email: "mina@gmail.com", password: "mina12")
User.create!(email: "stan@gmail.com", password: "stanislas")
User.create!(email: "roger@gmail.com", password: "roger1")

model = ["Cessna Denali", "Cessna Caravan", "Cirrus SR20", "Cirrus SR22", "Dassault Falcon", "Gulfstream G700"]
location = ["94390 Orly", "Charles de Gaulle, 95700 Roissy-en-France", "Dubai - U.A.E", "Manhattan, U.S.A"]

users = User.all
model.each do |model|
  category = ["Regional jet", "Light jet", "Medium jet", "Long haul jet" ]
  airplane = Airplane.create!(address: location.sample, model: model, category: category.sample, seat_capacity: rand(10..25), range: rand(1100.0..5000).round(3), daily_price: rand(3000..15000), user: users.sample)
  file = File.open("app/assets/images/dassault_falcon.jpg")
  airplane.photos.attach(io: file, filename: "airplane")
end

# airplaine1.user = user1
# airplaine1.save!