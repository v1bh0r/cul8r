# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(:email=>'vibhor.mahajan@gmail.com',:password=>'secret',:password_confirmation=>'secret',:admin=>true)
MovieDatabaseProvider.create!(:name => 'Manual Data Entry')
MovieDatabaseProvider.create!(:name => 'Rotten Tomatoes')