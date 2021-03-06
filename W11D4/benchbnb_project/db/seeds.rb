# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bench.delete_all

b1 = Bench.create!(
  description: "test1",
  lat: 37.46305,
  lng: 122.24482
)

b2 = Bench.create!(
  description: "test1",
  lat: 37.432305,
  lng: 122.24482
)

b3 = Bench.create!(
  description: "test1",
  lat: 37.46332315,
  lng: 122.24482
)

p "Done!"