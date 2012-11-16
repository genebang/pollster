class AddQuestionModel < ActiveRecord::Migration
  
  def up
    rename_column :responses, :poll_id, :question_id
    remove_column :polls, :question
  end

  def down
    rename_column :responses, :question_id, :poll_id
    add_column :polls, :question, :text
  end
  
end
