class ArticlesController < ApplicationController
  require 'news-api'

#grab articles from the DB where the interest id matches the interest id of the current user

  def index
    @news = []
    @interests_array = []
    current_user.interests.each do |i|
      @interests_array << i.name
    end

    Article.all.each do |n|
    if n.interest_id == current_user.interests[0].id
      @news << n
    end
  end



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
