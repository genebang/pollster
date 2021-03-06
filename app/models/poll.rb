class Poll < ActiveRecord::Base
  attr_accessible :title, :user_id, :admin_url, :public_url
  
  belongs_to :user
  has_many :questions, :dependent => :destroy
  
end
