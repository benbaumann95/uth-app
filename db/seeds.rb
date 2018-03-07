# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.destroy_all
User.destroy_all

Event.create(name: 'SHY FX and friends', quantity: '8', address: 'London', date_and_time: DateTime.tomorrow, category: 'club')
Event.create(name: 'SHY FX and friends', quantity: '2', address: 'London', date_and_time: DateTime.tomorrow, category: 'club')
Event.create(name: 'DJ HYPE', quantity: '8', address: 'London', date_and_time: DateTime.tomorrow, category: 'club')
Event.create(name: 'DJ HYPE', quantity: '3', address: 'Bristol', date_and_time: DateTime.tomorrow, category: 'club')
Event.create(name: 'House night', quantity: '2', address: 'Manchester', date_and_time: DateTime.tomorrow, category: 'club')
Event.create(name: 'Wireless', quantity: '1', address: 'London', date_and_time: DateTime.tomorrow, category: 'festival')

# Event.create(name: 'ABC', quantity: 5, location: 'Bristol', date: Date.today, start_time: DateTime.now, end_time: DateTime.tomorrow)
User.create(first_name: 'Cheryl', last_name: 'Chua', email: 'hello@unitix.com', password:'password')
User.create(first_name: 'Ben', last_name: 'Ben', email: 'ben@unitix.com', password:'password')

