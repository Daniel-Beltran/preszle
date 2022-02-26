class UserInterestsController < ApplicationController

  def index 
    @current_user_interest = current_user.interests
    @user_interest = UserInterest.new
  end  

  def new 
    @user_interest = UserInterest.new
  end


  def create
    interest_ids = params[:user_interest][:interest]
    interest_ids.shift
    interest_ids.each do |id|
      current_user.interests << Interest.find(id)
    end
  end  
 

end
