# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
 require 'news-api'

puts 'empty last seed'
Article.destroy_all
List.destroy_all
#User.destroy_all
Review.destroy_all
Bookmark.destroy_all
UserInterest.destroy_all
Interest.destroy_all


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

puts 'creating User_Interest'

(0...10).each do
  UserInterest.create!(user_id: User.all.sample[:id],
                        interest_id: Interest.all.sample[:id])
end

puts 'Fetching articles from the API'

Interest.all.each do |n|
  news = News.new(ENV["NEWS_API"])
    articles = news.get_everything(q: n.name, searchIn: "description", from: "#{(DateTime.now - 27.days).strftime("%Y-%m-%d")}&to=#{DateTime.current}", sortBy: "publishedAt", sources: "atlantic, ABC News, Bleacher Report, Breitbart News, newsweek, Next Big Future, National Geographic, talksport, The Wall Street Journal, MTV News, techradar, The Hindu, NBC News, Entertainment Weekly, New York Magazine, Crypto Coins News, FourFourTwo, Associated Press, reuters, wired", pageSize: 100)
    articles.each do |a|
        Article.create! title: a.title, description: a.description, source_url: a.url, image: a.urlToImage,
                                  source: a.name, interest_id: n.id, date_published: a.publishedAt,

                                  reading_time: ((a.content[/\+(.*?)c/, 1].to_i + a.content.size) / 7) / 80.to_f.ceil(0) + 1
      end
    puts "#{n.name} created with #{articles.length} articles"
    end
