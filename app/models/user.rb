class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :description
  
  has_many :projects

  has_many :user_to_interests
  has_many :interests, :through => :user_to_interests
  
  has_many :user_to_skills
  has_many :skills, :through => :user_to_skills

  def get_skill_value
    skills = []
    self.user_to_skills.each do |e|
      skills << [e.name, e.level]
    end
    skills
  end
  
  def get_skills
    skills = []
    self.skills.each do |e|
      skills << e.name
    end
    
    skills
  end
  
  def get_matching_total(skills)
    sum = 0.0
    self.user_to_skills.each do |e|
      if skills.include?(e.name)
        sum = sum + e.level
      end
    end
    sum
  end
  
  def get_weight(project)
    if (project.get_skills & self.get_skills).length == 0
      one = 0
      two = if self.get_interests.include?(project.category) then 10 else 0 end
    else  
      one = ((project.get_skills & self.get_skills).length/project.get_skills.length)*20.0
      two = if self.get_interests.include?(project.category) then 10 else 0 end
      three = sprintf "%.1f", ((self.get_matching_total(project.get_skills)/(project.get_skills & self.get_skills).length)*7.0 + two + one)
    end
  end
    
  def get_interests
    interests = []
    
    self.user_to_interests.each do |e|
      interests << e.name
    end
    interests
  end
  
  def get_project_ids
    ids = []
    
    self.projects.each do |p|
      ids << p.id
    end
    ids
  end
  
end
