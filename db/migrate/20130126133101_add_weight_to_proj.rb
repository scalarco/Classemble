class AddWeightToProj < ActiveRecord::Migration
  def change
    add_column :projects, :weight, :decimal
  end
end
