# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.create email: 'gk@gk.com', username: 'gk', password: '1234', role: 'admin'
u = User.create email: 'lali@lali.com', username: 'lali', password: '1234', role: 'admin'
u = User.create email: 'dan@dan.com', username: 'dan', password: '1234', role: 'admin'