class ArticlesController < ApplicationController
  require 'news-api'
  def index
    @news = []
    @interests_array = []
    @reading_time = 0

    current_user.interests.each do |i|
      @interests_array << i.name
    end
    @interests = @interests_array.join(" OR ")
    @news = Article.last (10)
    # @api_news = News.new(ENV["NEWS_API"])
    # @possible_articles = @api_news.get_everything(q: @interests, searchIn: "title",
    #                                               from: "#{(DateTime.now - 25.days).strftime("%Y-%m-%d")}&to=#{DateTime.current}", sortBy: "popularity", sources: "reuters, wired, atlantic, ABC News, Bleacher Report, Breitbart News, newsweek, Next Big Future, National Geographic, talksport, The Wall Street Journal, MTV News, techradar, The Hindu, NBC News, Entertainment Weekly, New York Magazine, Crypto Coins News, FourFourTwo, Associated Press",
    #                                               pageSize: 9)
    # @possible_articles.each do |n|
    #   @reading_time = ((n.content[/\+(.*?)c/, 1].to_i + n.content.size) / 7) / 250.to_f.ceil(0)
    #   if @reading_time <= current_user.readtime
    #     @news << (Article.create! title: n.title, description: n.description, source_url: n.url, image: n.urlToImage,
    #                               source: n.name, interest_id: current_user.interests[0].id,
    #                               reading_time: @reading_time)
    #   end
    # end

#SAVING AND DISPLAYING 3 PLACEHOLDERS
    #3.times do
    #   @news << ((Article.create! title: "Article", description: "Here goes the description", source: "Article Source", reading_time: 15,
    #             source_url: "https://en.wikipedia.org/wiki/Pretzel", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/BrezelnSalz02_%28cropped%29.JPG/375px-BrezelnSalz02_%28cropped%29.JPG", author: "Its a me", content:"Mario", interest_id: 1))
    #end
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
