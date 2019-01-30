# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
Cat.create!(name: "San", color: Cat::COLORS.sample, birth_date: Date.new(2017, 1, 28), sex: "F", description: "Likes the bridge")
Cat.create!(name: "Francisco", color: "Orange Taby", birth_date: Date.today, sex: "M", description: "Likes the giants")
Cat.create!(name: "Santa", color: Cat::COLORS.sample, birth_date: Date.new(2015, 11, 5), sex: "F", description: "Likes the wine")
Cat.create!(name: "Rosa", color: Cat::COLORS.sample, birth_date: Date.new(2016, 4, 5), sex: "F", description: "Likes the beer")