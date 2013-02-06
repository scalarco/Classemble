class CreateUserToSkills < ActiveRecord::Migration
  def change
    create_table :user_to_skills do |t|

      t.integer :level
      t.integer :user_id
      t.integer :skill_id
      
      t.timestamps
    end
  end
end
