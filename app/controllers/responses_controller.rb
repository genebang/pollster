class ResponsesController < ApplicationController
  before_filter :load_poll_and_question

  def new
    @response = Response.new
  end

  def create
    @response = @question.responses.build(params[:response])
    if @response.save
      redirect_to :back, :notice => "answer submitted"
    else
      render :back
    end

  end

  private
  def load_poll_and_question
    @poll = Poll.find(params[:poll_id])
    @question = Question.find(params[:question_id])
  end

end
