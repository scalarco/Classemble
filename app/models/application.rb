class Application < ActiveRecord::Base
  attr_accessible :user_id, :project_id, :message
  
  belongs_to :user
  belongs_to :project
  
  
end
