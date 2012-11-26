class QuestionsController < ApplicationController
  before_filter :load_poll, :except => :destroy

  def new
    @question = @poll.questions.build
  end

  def create
    @question = @poll.questions.build(params[:question])
    if @question.save
      redirect_to admin_poll_path(@poll.admin_url)
    else
      render :new
    end

  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(params[:question])
    # redirect_to @poll
    redirect_to admin_poll_path(@poll.admin_url), :notice => "question updated"
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to admin_poll_path(@question.poll.admin_url)
  end

  private
  def load_poll
    @poll = Poll.find(params[:poll_id])
  end

end
