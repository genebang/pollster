class Response < ActiveRecord::Base
  attr_accessible :poll_id, :response
  
  belongs_to :poll
end
