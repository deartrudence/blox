# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create!(name: 'Header')

a = Bloc.create!(
	name: 'header1', 
	code: '<header></header>',
	category: Category.find_by(name: "Header"),
	img_url: 'http://placehold.it/800x150/e5e5e5'
)

b = Bloc.create!(
	name: 'header2', 
	code: '<header></header>',
	category: Category.find_by(name: "Header"),
	img_url: 'http://placehold.it/800x150/333333'
)

c = Bloc.create!(
	name: 'header3', 
	code: '<header></header>',
	category: Category.find_by(name: "Header"),
	img_url: 'http://placehold.it/800x150/4d4d4d'
)

Webpage.create!([
	name: 'Website 01',
	blocs: [a, b, c]
])