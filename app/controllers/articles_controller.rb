class ArticlesController < ApplicationController
  def index
    @n = News.new("7b0920db76484943a73573fee21b80de")
    @n.get_top_headlines(sources: "bbc-news")
  end
end
