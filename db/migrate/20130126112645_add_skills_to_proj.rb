class AddSkillsToProj < ActiveRecord::Migration
  def change
    add_column :projects, :skills, :string
  end
end
