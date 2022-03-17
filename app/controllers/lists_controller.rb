class ListsController < ApplicationController


  def index
    @lists = current_user.lists
    new
  end

  def show
    @list = List.find(params[:id])
    @articles = @list.articles
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    current_user.lists << @list
    if @list.save
      redirect_to lists_path
    else 
      redirect_to lists_path, notice: "Invalid name"
   end  
  end  

  def create_on_bookmarks
    @list = List.new(list_params)
    @article = Article.find(params[:id])
    current_user.lists << @list
    if @list.save
      @list.articles << @article
      redirect_to article_path(params[:id])
    else 
      redirect_to new_article_bookmark_path(params[:id]), notice: "Invalid name"
   end  
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

end
