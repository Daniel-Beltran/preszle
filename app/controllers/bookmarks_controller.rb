class BookmarksController < ApplicationController

  before_action :find_article, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.article = @article
    @bookmark.save
    redirect_to article_path(@article)
  end


private

  def bookmark_params
    params.require(:bookmark).permit(:list_id)
  end

  def find_article
    @article = Article.find(params[:article_id])
  end  

end  
