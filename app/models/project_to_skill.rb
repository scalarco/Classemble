class ProjectToSkill < ActiveRecord::Base
  attr_accessible :project_id, :skill_id

  belongs_to :project
  belongs_to :skill
  
  def name
    Skill.find(self.skill_id).name
  end

end
