class PollsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @poll = Poll.new
  end
  
end
