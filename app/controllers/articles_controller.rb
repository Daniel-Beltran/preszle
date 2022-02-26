class ArticlesController < ApplicationController
  require 'news-api'
  def index
    @news = []
    @api_news = News.new(ENV["NEWS_API"])
    @three_articles = @api_news.get_everything(q: "blockchain", searchIn: "title",
                                               from: "2022-01-25&to=2022-02-22", sortBy: "popularity", pageSize: 3)
    @three_articles.each do |n|
      @news << (Article.create title: n.title, description: n.description, source_url: n.url)
    end
  end
end
