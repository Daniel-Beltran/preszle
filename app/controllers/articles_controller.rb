class ArticlesController < ApplicationController
  require 'news-api'
  def index
    @news = []

#HOW TO CHECK THE READING TIME OF THE ARTICLES MATCHES WITH THE USERS READING TIME
    #loop untill counter is 3
      #grab an article from news api that matches user interest
      #check the content of the article to determine how long it would take to read
      #check if the reading time is less than the reading time that has been given by the user
        #if the reading time of the article is below or equal of the user:
          #the article gets created and saved in an array
          #the counter goes up by 1
          #loop starts again
        #if the reading time of the article is above the user´s
          #nothing happens
          #loop starts again
    #loop ends when the counter = 3 and thus there are 3 articles in the array
    #the 3 articles in the array get displayed

#SAVING AND DISPLAYING 3 ARTICLES USING THE NEWS API
    @interests_array = []
    current_user.interests.each do |i|
      @interests_array << i.name
    end
    @interests = @interests_array.join(" OR ")
    @api_news = News.new(ENV["NEWS_API"])
    @three_articles = @api_news.get_everything(q: @interests, searchIn: "title",
                                               from: "2022-02-10&to=2022-03-03", sortBy: "popularity", sources: "reuters, wired, atlantic, ABC News, Bleacher Report, Breitbart News, newsweek, Next Big Future, National Geographic, talksport, The Wall Street Journal, MTV News, techradar, The Hindu, NBC News, Entertainment Weekly, New York Magazine, Crypto Coins News, FourFourTwo, Associated Press",pageSize: 3)
    @three_articles.each do |n|
      @news << (Article.create! title: n.title, description: n.description, source_url: n.url, image: n.urlToImage,
                                source: n.name, interest_id: current_user.interests[0].id, author: "Not Found", content: n.content,
                                reading_time: ((n.content[/\+(.*?)c/, 1].to_i + n.content.size - 11) / 5) / 250.to_f.ceil(0))
    end

#SAVING AND DISPLAYING 3 PLACEHOLDERS
    #3.times do
      #@news << ((Article.create! title: "Article", description: "Here goes the description", source: "Article Source", reading_time: 15,
                 #source_url: "https://en.wikipedia.org/wiki/Pretzel", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/BrezelnSalz02_%28cropped%29.JPG/375px-BrezelnSalz02_%28cropped%29.JPG", author: "Its a me", content:"Mario", interest_id: 1))
    #end
  end

  def show
    @article = Article.find(params[:id])
  end
end
