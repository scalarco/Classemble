class ProjectToSkillsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @skill = ProjectToSkill.new
  end
  
  def create
    @project = Project.find(params[:project_to_skill][:project_id])
    @skill = ProjectToSkill.new(params[:project_to_skill])
    @skill.save
    redirect_to new_project_to_skill_path(:project_id => @project.id)
  end
end
