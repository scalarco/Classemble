class ChangeProject < ActiveRecord::Migration
  def up
    remove_column :projects, :interest_id
    add_column :projects, :category, :string
  end

  def down
    add_column :projects, :interest_id, :integer
    remove_column :projects, :category
  end
end
