class UserToSkillsController < ApplicationController
  
  def new
    @skill = UserToSkill.new
  end
  
  def create
    @skill = UserToSkill.new(params[:user_to_skill])
    @skill.save
    redirect_to new_user_to_skill_path
  end
    
end
