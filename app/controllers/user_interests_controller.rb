class UserInterestsController < ApplicationController

  def index
    @user_interest = UserInterest.new
    new
  end


  def new
    @user_interest = UserInterest.new
    @user_interests = current_user.interests if current_user.interests
    @interests = Interest.all
  end

  def create
    @user_interest = UserInterest.new
    @interests = Interest.all
    @user_interests = current_user.interests
    interest_ids = params[:user_interest].keys
    current_user.interests.clear
    interest_ids.each do |id|
      if params[:user_interest][id] == "1"
        current_user.interests << Interest.find(id.to_i)
      end
    end
    if current_user.interests.length.positive?
      List.create!(name: "History", user_id: current_user.id) 
      redirect_to articles_path
    else
      redirect_to user_interests_path :new, notice: "Choose at least one interest"
    end
  end

  def update
    @user_interest = UserInterest.new
    @interests = Interest.all
    @user_interests = current_user.interests
    interest_ids = params[:user_interest].keys
    current_user.interests.clear
    interest_ids.each do |id|
      if params[:user_interest][id] == "1"
        current_user.interests << Interest.find(id.to_i)
      end
    end
    if current_user.interests.length.positive?
      redirect_to articles_path
    else
      redirect_to my_interests_path, notice: "Choose at least one interest"
    end
  end
end
