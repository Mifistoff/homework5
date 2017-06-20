# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(login: 'admin', role: 'admin', password: 'admin')
User.create(login: 'user1', role: 'user', password: 'user')
User.create(login: 'user2', role: 'user', password: 'user')
User.create(login: 'user3', role: 'user', password: 'user')
User.create(login: 'user4', role: 'user', password: 'user')
User.create(login: 'user5', role: 'user', password: 'user')

Event.create(name: 'BBQ', place: 'Center', date: '2017-06-25', description: 'BBQ desciption')
Event.create(name: 'Pizza-Day', place: 'Someweare', date: '2017-06-29', description: 'Greating all on Pizza-Day')
