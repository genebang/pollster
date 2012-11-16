class AddUrlsToPolls < ActiveRecord::Migration
  def up
    add_column :polls, :admin_url, :string
    add_column :polls, :public_url, :string
  end
  
  def down
    remove_column :polls, :admin_url
    remove_column :polls, :public_url
  end
  
end
