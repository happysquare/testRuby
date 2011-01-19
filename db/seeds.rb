# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
user = User.create :email => 'this@that.com', :password => 'password'
Category.create([ {:name => "Programming"},
                    {:name => "Travel"},
                    {:name => "Cooking"},
                    {:name => "Music"},
                    {:name => "TV"} ])

user.articles.create :title => 'Article 1 title', => :body => 'this is the user article body', :published_at => Date.today
user.articles.create :title => 'Brticle 2 title', => :body => 'this is the user article body', :published_at => Date.today
user.articles.create :title => 'Crticle 3 title', => :body => 'this is the user article body', :published_at => Date.today
user.articles.create :title => 'Drticle 4 title', => :body => 'this is the user article body', :published_at => Date.today