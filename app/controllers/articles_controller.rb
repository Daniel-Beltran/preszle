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
          if n.reading_time <= current_user.readtime
            @news << n
          end
        end
      end
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit_card
    @article = Article.find(params[:format])
  end

  def update
    if current_user.editor
      article = Article.find(params[:id])
      article.card_orientation = article_params[:card_orientation]
      if article.save
        redirect_to edit_card_path(article)
      else
        render :edit_card
      end
    end
  end

  private

  def article_params
    params.require(:article).permit(:card_orientation)
  end
end
