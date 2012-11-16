class AddQuetsionToPolls < ActiveRecord::Migration
  
  def up
    add_column :polls, :question, :string
  end
  
  def down
    remove_column :polls, :question
  end
  
end
