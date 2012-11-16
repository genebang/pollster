class AddQuetsionToPolls < ActiveRecord::Migration
  
  def up
    add_column :polls, :question, :text
  end
  
  def down
    remove_column :polls, :question
  end
  
end
