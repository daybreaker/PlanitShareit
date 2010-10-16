# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

users = User.create([:email => 'test_user@example.com', :username => 'test', :password => 'getmein'])
trips = Trip.create([{ :title => 'Test Trip 1', :destination => 'Test Destination', :start_date => '2010-12-12', :end_date => '2010-12-24', :user => users.first}])
Event.create(:title => 'Test Event 1', :start_date => '2010-12-12 10:00:00 CST', :end_date => '2010-12-12 11:00:00 CST', :trip => trips.first)
Event.create(:title => 'Test Event 2', :start_date => '2010-12-12 11:30:00 CST', :end_date => '2010-12-12 12:00:00 CST', :trip => trips.first)
