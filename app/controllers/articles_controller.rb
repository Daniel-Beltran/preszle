class ArticlesController < ApplicationController
  require 'news-api'
  def index
    @news = []
    @interests_array = []
    current_user.interests.each do |i|
      @interests_array << i.name
    end
    Article.all.each do |n|
      (0...current_user.interests.count).each do |i|
        if n.interest_id == current_user.interests[i].id
          @news << n
        end
      end
    end
  end

  def show
    @article = Article.find(params[:id])
  end
end
