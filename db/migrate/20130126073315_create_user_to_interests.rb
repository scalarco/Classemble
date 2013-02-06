class CreateUserToInterests < ActiveRecord::Migration
  def change
    create_table :user_to_interests do |t|
      t.integer :user_id
      t.integer :interest_id
      t.timestamps
    end
  end
end