class UserInterestsController < ApplicationController

  def new 
    @user_interest = UserInterest.new
  end


  def create
    @user_interest = UserInterest.new(user_interest_params)
    @user_interest.user = current_user
  end  
 

end
