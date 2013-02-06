class Project < ActiveRecord::Base
  
  has_many :project_to_skills
  
  has_many :applications
  
  attr_accessible :name, :category_id, :short_description, :description, :title, :user_id, :category, :skills, :weight

  def get_skills
    skills = []
    self.project_to_skills.each do |e|
      skills << e.name
    end
    
    skills
  end

  def js_skills
  	skills = ""
  	self.project_to_skills.each do |e|
  		skills = skills + "&" + e.name
  	end
  	skills
  end
  
  def get_weight(user)
    if (self.get_skills & user.get_skills).length == 0
      one = 0
      two = if user.get_interests.include?(self.category) then 20 else 0 end
    else  
      one = ((self.get_skills & user.get_skills).length/self.get_skills.length)*25.0
      two = if user.get_interests.include?(self.category) then 20 else 0 end
      three = sprintf "%.1f", ((user.get_matching_total(self.get_skills)/(self.get_skills & user.get_skills).length)*5.5 + two + one)
    end
  end
end
