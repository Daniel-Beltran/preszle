class UserInterestsController < ApplicationController

  def index
    new
  end


  def new
    @user_interests = current_user.interests
    @interests = Interest.all
  end

  def create
    @interests = Interest.all
    @user_interests = current_user.interests
    interest_ids = params[:user_interest].keys
    current_user.interests.clear
    interest_ids.each do |id|
      if params[:user_interest][id] == "1"
        current_user.interests << Interest.find(id.to_i)
      end
    end
      if current_user.interests.length > 0
        redirect_to articles_path
      else  
      render :new
      end
  end

  def update
    @interests = Interest.all
    @user_interests = current_user.interests
    interest_ids = params[:user_interest].keys
    current_user.interests.clear
    interest_ids.each do |id|
      if params[:user_interest][id] == "1"
        current_user.interests << Interest.find(id.to_i)
      end
    end
      if current_user.interests.length > 0
        redirect_to articles_path
      else  
      render :index
      end
  end
end
