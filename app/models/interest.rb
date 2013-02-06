class Interest < ActiveRecord::Base
  attr_accessible :name
  
  has_and_belongs_to_many :users
  
  has_many :projects
    # attr_accessible :title, :body
end
