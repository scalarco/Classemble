class UserToSkill < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill
  
  attr_accessible :user_id, :skill_id, :level
  
  def name
    Skill.find(self.skill_id).name
  end
  
  validates :level, :numericality => { :greater_than => 0, :less_than_or_equal_to => 10 }
end
