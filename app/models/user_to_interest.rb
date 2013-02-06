class UserToInterest < ActiveRecord::Base
  belongs_to :user
  belongs_to :interest
  
  attr_accessible :user_id, :interest_id
  
  def name
    Interest.find(self.interest_id).name
  end
end
