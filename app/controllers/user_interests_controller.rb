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
    interest_ids = params[:user_interest].keys
    current_user.interests.clear
    interest_ids.each do |id|
      if params[:user_interest][id] == "1"
        current_user.interests << Interest.find(id.to_i)
      end
    end
    redirect_to articles_path
  end
end
