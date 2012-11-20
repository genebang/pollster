class Question < ActiveRecord::Base
  attr_accessible :question, :style, :poll_id
  
  belongs_to :poll
  has_many :options, :dependent => :destroy
  has_many :responses, :dependent => :destroy
  
  # accepts_nested_attributes_for :options
end
