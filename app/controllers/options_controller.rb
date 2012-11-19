class OptionsController < ApplicationController
  
  def new
    @poll = Poll.find(params[:poll_id])
    @question = Question.find(params[:question_id])
    @option = Option.new
  end
  
  
end
