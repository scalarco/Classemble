class ApplicationsController < ApplicationController
  def index
  end
  
  def new
    @project = Project.find(params[:project_id])
    @application = Application.new
  end
  
  def create
    @application = Application.new(params[:application])
    if @application.save then
      flash[:notice] = "Application Submitted Successfully!"
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
  
  def myapplications
    ids = current_user.projects.pluck(:id)
    test = []
    apps = Application.all
    apps.each do |a|
      if ids.include?(a.project_id)
        test << a
      end
    end
    @applications = test
    
    ids = []
    @applications.each do |a|
      ids << a.user_id
    end
    @users = User.where(:id => ids)
  end
  
end
