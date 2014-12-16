# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# User.create(email: "admin@gmail.com",password: "admin123",password_confirmation: "admin123",admin: true)
10.times { |i| Post.create(title: "Post #{50+i}", body: BetterLorem.p(5, false, false)) }