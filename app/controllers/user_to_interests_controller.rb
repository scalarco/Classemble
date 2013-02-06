class UserToInterestsController < ApplicationController
  def new
    @interest = UserToInterest.new
  end
  
  def create
    @interest = UserToInterest.new(params[:user_to_interest])
    @interest.save
    redirect_to new_user_to_interest_path
  end
end
