class EditProject < ActiveRecord::Migration
  def up
    remove_column :projects, :category_id
    
    add_column :projects, :interest_id, :integer
  end
  
  def down
    remove_column :projects, :interest_id
    add_column :projects, :category_id, :integer
  end
end
