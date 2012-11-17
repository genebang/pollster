class QuestionsController < ApplicationController
  
  def new
    @poll = Poll.find(params[:poll_id])
    @question = Question.new
  end
  
  def create
    @poll = Poll.find(params[:poll_id])
    @question = @poll.questions.build(params[:question])
    @question.save
    redirect_to @poll
  end
  
  def edit
    @poll = Poll.find(params[:poll_id])
    @question = Question.find(params[:id])
  end
  
  def update
    @poll = Poll.find(params[:poll_id])
    @question = Question.find(params[:id])
    @question.update_attributes(params[:question])
    redirect_to @poll
  end
  
  def destroy
    # @poll = Poll.find(params[:poll_id])
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to @question.poll
  end
  
end
