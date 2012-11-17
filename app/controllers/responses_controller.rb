class ResponsesController < ApplicationController
  
  def new
    @poll = Poll.find(params[:poll_id])
    @question = Question.find(params[:question_id])
    @response = Response.new
  end
  
  def create
    # @poll = Poll.find(params[:poll_id])
    @question = Question.find(params[:question_id])
    @response = @question.responses.build(params[:response])
    @response.save
    redirect_to taker_path(@question.poll)
  end
  
end
