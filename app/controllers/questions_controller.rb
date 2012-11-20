class QuestionsController < ApplicationController
  
  def new
    @poll = Poll.find(params[:poll_id])
    @question = Question.new
  end
  
  def create
    @poll = Poll.find(params[:poll_id])
    @question = @poll.questions.build(params[:question])
    @question.save
    # redirect_to @poll
    redirect_to admin_poll_path(@poll.admin_url)
  end
  
  def edit
    @poll = Poll.find(params[:poll_id])
    @question = Question.find(params[:id])
  end
  
  def update
    @poll = Poll.find(params[:poll_id])
    @question = Question.find(params[:id])
    @question.update_attributes(params[:question])
    # redirect_to @poll
    redirect_to admin_poll_path(@poll.admin_url)
  end
  
  def destroy
    # @poll = Poll.find(params[:poll_id])
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to admin_poll_path(@question.poll.admin_url)
  end
  
end
