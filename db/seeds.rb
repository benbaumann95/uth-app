# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Event.create(name: 'ABC', quantity: 5, location: 'Bristol', date: Date.today, start_time: DateTime.now, end_time: DateTime.tomorrow)
User.create(first_name: 'Cheryl', last_name: 'Chua', email: 'hello@unitix.com', password:'password')
