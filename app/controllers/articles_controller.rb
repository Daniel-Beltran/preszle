class ArticlesController < ApplicationController
  require 'news-api'
  def index
    @n = News.new("7b0920db76484943a73573fee21b80de")
    @x = @n.get_everything(q: "russia", from: "2022-02-20&to=2022-02-22", sortBy: "popularity")
  end
end
