class ArticlesController < ApplicationController
  require 'news-api'
  def index
    @user = current_user
    @news = []
    @interests_array = []
    @reading_time = 0
    @titles_array = []
    counter = 0

    # Loop untill counter is 3
    #until counter == 3
      # Grab an article from news api that matches user interest
      current_user.interests.each do |i|
        @interests_array << i.name
      end
      @interests = @interests_array.join(" OR ")
      @api_news = News.new(ENV["NEWS_API"])
      @possible_article = @api_news.get_everything(q: @interests, searchIn: "title",
                                                   from: "2022-02-18&to=2022-03-03", sortBy: "popularity", sources: "reuters, wired, atlantic, ABC News, Bleacher Report, Breitbart News, newsweek, Next Big Future, National Geographic, talksport, The Wall Street Journal, MTV News, techradar, The Hindu, NBC News, Entertainment Weekly, New York Magazine, Crypto Coins News, FourFourTwo, Associated Press",
                                                   pageSize: 1)
      # Check the content of the article to determine how long it would take to read
      #@possible_article.each do |n|
        #@reading_time = ((n.content[/\+(.*?)c/, 1].to_i + n.content.size) / 5) / 250.to_f.ceil(0)
        #@title = n.title
      #end

      # Check if the reading time is less or equal than the reading time that has been given by the user
      #if @reading_time <= current_user.readtime && (@titles_array.include? @title) == false
        # The article gets created and saved in an array (if the reading time of the article is below or equal of the user)
        @possible_article.each do |n|
          @news << (Article.create! title: n.title, description: n.description, source_url: n.url, image: n.urlToImage,
                                     source: n.name, interest_id: current_user.interests[0].id,
                                     reading_time: @reading_time)
          @news << @article
          #@titles_array << @article.title
          #counter += 1

      end

    #check what it returns, ignoring the reading time & giving 3 articles

#SAVING AND DISPLAYING 3 PLACEHOLDERS
    #3.times do
    #   @news << ((Article.create! title: "Article", description: "Here goes the description", source: "Article Source", reading_time: 15,
    #             source_url: "https://en.wikipedia.org/wiki/Pretzel", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/BrezelnSalz02_%28cropped%29.JPG/375px-BrezelnSalz02_%28cropped%29.JPG", author: "Its a me", content:"Mario", interest_id: 1))
    #end
  end

  def show
    @article = Article.find(params[:id])
  end
end
