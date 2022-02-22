class ArticlesController < ApplicationController
  require 'news-api'
  def index
    @n = News.new("7b0920db76484943a73573fee21b80de")
    @x = @n.get_everything(q: "crypto", from: "2022-02-10&to=2022-02-22", sortBy: "popularity")
  end
end
