class OptionsController < ApplicationController
  
  def new
    # @poll = Poll.find(params[:poll_id])
    # @question = Question.find(params[:question_id])
    # @option = Option.new
  end
  
  def create
    @question = Question.find(params[:question_id])
    @option = @question.options.build(params[:option])
    @option.save
    # redirect_to edit_poll_question_path(@question.poll_id, @question.id)
    if @option.save
      render :json => {:success => true, :option => render_to_string(:partial => "options/option",  :locals => {:option => @option})}
    else
      render :json => @question.errors.full_messages.join(', '), :status => :unprocessable_entity
    end
  end
  
  def update
    @question = Question.find(params[:question_id])
    @option = @question.options.build(params[:option])
    @option.save
    redirect_to edit_poll_question_path(@question.poll_id, @question.id)
  end
  
  def destroy
    @question = Question.find(params[:question_id])
    @option = Option.find(params[:id])
    @option.destroy
    redirect_to edit_poll_question_path(@question.poll_id, @question.id)
    # redirect_to :url => { :controller => :questions, :action => :edit }
  end
  
end
