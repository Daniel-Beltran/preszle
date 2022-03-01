class ArticlesController < ApplicationController
  require 'news-api'
  def index
    @news = []
    #@api_news = News.new(ENV["NEWS_API"])
    #@three_articles = @api_news.get_everything(q: "blockchain", searchIn: "title",
    #                                           from: "2022-01-25&to=2022-02-22", sortBy: "popularity", pageSize: 3)
    #@three_articles.each do |n|
      #@news << (Article.create title: n.title, description: n.description, source_url: n.url, image: n.urlToImage, source: n.source)
    #end
    3.times do
      @news << ((Article.create title: "Article", description: "Here goes the description", source: "Article Source", reading_time: 15,
                 source_url: "https://en.wikipedia.org/wiki/Pretzel", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/BrezelnSalz02_%28cropped%29.JPG/375px-BrezelnSalz02_%28cropped%29.JPG"))
    end
  end
end
