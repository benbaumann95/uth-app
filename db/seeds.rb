# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Event.create(name: 'SHY FX and friends', quantity: '8', location: 'London', date: Date.tomorrow, category: 'club')
Event.create(name: 'SHY FX and friends', quantity: '2', location: 'London', date: Date.tomorrow, category: 'club')
Event.create(name: 'DJ HYPE', quantity: '8', location: 'London', date: Date.tomorrow, category: 'club')
Event.create(name: 'DJ HYPE', quantity: '3', location: 'Bristol', date: Date.tomorrow, category: 'club')
Event.create(name: 'House night', quantity: '2', location: 'Manchester', date: Date.tomorrow, category: 'club')
Event.create(name: 'Wireless', quantity: '1', location: 'London', date: Date.tomorrow, category: 'festival')

# Event.create(name: 'ABC', quantity: 5, location: 'Bristol', date: Date.today, start_time: DateTime.now, end_time: DateTime.tomorrow)
User.create(first_name: 'Cheryl', last_name: 'Chua', email: 'hello@unitix.com', password:'password')

