# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'empty last seed'
Interest.destroy_all
List.destroy_all
User.destroy_all
Review.destroy_all
Bookmark.destroy_all
Article.destroy_all

puts 'creating users'

user_names = Faker::Name.unique.name  

(0...10).each do
  user_name = Faker::Name.unique.name  
  domains = %w[gbites.com hotzels.be wahoo.be]
  user = User.create!(user_name: user_name,
                      email: "#{user_name.split.join('.')}@#{domains.sample}",
                      password: 'password')
  puts "created #{user.user_name}"
end

puts 'creating interests'

interests = ["Business", "Cars", "Celebrities", "Design", "Food", "Gaming", "Lifestyle", "Movies", "Music", "News", "Photography", "Politics", "Technology", "Travel", "Science", "Sports"]
interests.each { |interest| Interest.create!(name:interest)}

puts 'creating lists'

lists = ["Metro reading", "Impress the boss", "Toilet brake"]
lists.each do |list|
  List.create!(name: list,
              user_id: User.all) 
end

(0...10).each do 
  UserInterest.create!(user_id: User.all.sample[:id],
                        interest_id: Interest.all.sample[:id])
end


