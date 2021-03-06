class Question < ActiveRecord::Base
  attr_accessible :question, :poll_id
  
  belongs_to :poll
  has_many :responses, :dependent => :destroy
  
end
