class ArticlesController < ApplicationController
  require 'news-api'
  def index
    @y = []
    @news = News.new(ENV["NEWS_API"])
    @x = @news.get_everything(q: "spain", from: "2022-01-25&to=2022-02-22", sortBy: "popularity", pageSize: 3)
  end
end
