class AddQuestionType < ActiveRecord::Migration
  def up
    add_column :questions, :style, :string, :default => 'text'
  end

  def down
    remove_column :questions, :style
  end
end
