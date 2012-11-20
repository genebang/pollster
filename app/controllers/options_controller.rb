class OptionsController < ApplicationController
  
  def new
    @poll = Poll.find(params[:poll_id])
    @question = Question.find(params[:question_id])
    @option = Option.new
  end
  
  def update
    @question = Question.find(params[:question_id])
    @option = @question.options.build(params[:option])
    @option.save
    redirect_to edit_poll_question_path(@question.poll_id, @question.id)
  end
  
end
