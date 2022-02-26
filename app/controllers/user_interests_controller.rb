class UserInterestsController < ApplicationController

  def index
    @user_interests = current_user.interests
    @interests = Interest.all
    @updated_interests=[]
    @no_interests=[]
  end  

  def new 
    @user_interest = UserInterest.new
  end

  def create
    interest_ids = params[:user_interest][:interest]
    interest_ids.delete("")
    interest_ids.each do |id|
      current_user.interests << Interest.find(id)
    end
  end  
 

end
