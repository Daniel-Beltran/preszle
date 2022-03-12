class BookmarksController < ApplicationController

  before_action :find_article, only: [:new, :create]
  before_action :set_bookmark, only: [:destroy]

  def new
    @bookmark = Bookmark.new
    @list = List.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.article = @article
     if @bookmark.save
      redirect_to article_path(@article)
     else 
      render :new
     end  
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end


private

  def bookmark_params
    @bookmark = params.require(:bookmark).permit(:list_id)
  end

  def set_bookmark
    @bookmark  = Bookmark.find(params[:id])
  end

  def find_article
    @article = Article.find(params[:article_id])
  end  

end  
