class Poll < ActiveRecord::Base
  attr_accessible :title, :user_id, :admin_url, :public_url, :question
  
  belongs_to :user
  has_many :responses
  
end
