class ResponsesController < ApplicationController
  
  def create
    @poll = Poll.find(params[:poll_id])
    @response = @poll.responses.build(params[:response])
    @response.save
    redirect_to @poll
  end
  
end
