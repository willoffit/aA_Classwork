# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

cat1 = Cat.create!(birth_date: '2015/01/20', color: 'red', name: 'Kitty', sex: 'M', description: 'The cat was nice')
cat2 = Cat.create!(birth_date: '2014/01/20', color: 'blue', name: 'Larry', sex: 'M', description: 'The cat was meh')
cat3 = Cat.create!(birth_date: '2013/01/20', color: 'green', name: 'Abigail', sex: 'F', description: 'The cat was alright')
cat4 = Cat.create!(birth_date: '2012/01/20', color: 'yellow', name: 'Steve', sex: 'M', description: 'The cat was mean')


puts 'Done!'