# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@weblox = User.where(email: 'buildweblox@gmail.com')

Bloc.all.each do | bloc |
  bloc.user = @weblox
end

User.all.each do | user |
	p =  Profile.create!
	user.profile = p 
	user.save
	if user.email.include? '@'
		p.handle = user.email.split("@").first
	else
		p.handle = user.email
	end
	p.save
  bloc.each do |bloc|
    if bloc.user.email == 'buildweblox@gmail.com'
      bucket_bloc = BucketBloc.new
      bucket_bloc.bloc = bloc
      bucket_bloc.user = user
      bucket_bloc.save
    end
  end
end
# Category.create!(name: 'Header')

# a = Bloc.create!(
# 	name: 'header1', 
# 	code: '<header></header>',
# 	category: Category.find_by(name: "Header"),
# 	img_url: 'http://placehold.it/800x150/e5e5e5'
# )

# b = Bloc.create!(
# 	name: 'header2', 
# 	code: '<header></header>',
# 	category: Category.find_by(name: "Header"),
# 	img_url: 'http://placehold.it/800x150/333333'
# )

# c = Bloc.create!(
# 	name: 'header3', 
# 	code: '<header></header>',
# 	category: Category.find_by(name: "Header"),
# 	img_url: 'http://placehold.it/800x150/4d4d4d'
# )

# page = Webpage.create!(name: 'Website 01')

# WebLayout.create! webpage: page, bloc: c, position: 3
# WebLayout.create! webpage: page, bloc: a, position: 1
# WebLayout.create! webpage: page, bloc: b, position: 2