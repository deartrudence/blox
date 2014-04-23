# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category = Category.create([{name: 'Header'}])

bloc = Bloc.create([
	{ name: 'header1'}, 
	{ code: '<header></header>'},
	{ category_id: 1},
	{ img_url: 'http://placehold.it/800x150/e5e5e5'}
])

bloc = Bloc.create([
	{ name: 'header2'}, 
	{ code: '<header></header>'},
	{ category_id: 1},
	{ img_url: 'http://placehold.it/800x150/333333'}
])
bloc = Bloc.create([
	{ name: 'header3'}, 
	{ code: '<header></header>'},
	{ category_id: 1},
	{ img_url: 'http://placehold.it/800x150/4d4d4d'}
])

webpage = Webpage.create([
	{ name: 'Website 01'},
	{ bloc_id: [1,2,3]}
])