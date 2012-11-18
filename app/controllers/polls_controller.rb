class PollsController < ApplicationController
  
  # before_filter :authenticate_user!
  
  def index
    @polls = Poll.all
    # @polls = Poll.where(:user_id => current_user.id)
  end
  
  def new
    @poll = Poll.new
  end
  
  def show
    # @poll = Poll.includes(:questions).find(params[:id])
    # @poll = Poll.find(params[:id])
    @poll = Poll.find_by_admin_url(params[:admin_url])
    #grab all poll questions
    @questions = Question.find_all_by_poll_id(@poll.id)
    # @responses = Response.find_all_by_question_id(@question.id)
  end
  
  def edit
    @poll = Poll.find(params[:id])
    #grab all poll questions
  end
  
  def create
    # @poll = Poll.new(:title => params[:poll][:title],
    #                  :user_id => current_user.id)
    @poll = Poll.new(params[:poll])
    @poll.admin_url = short_url
    @poll.public_url = short_url
    @poll.save
    redirect_to @poll
  end
  
  def destroy
    @poll = Poll.find(params[:id])
    @poll.destroy
    
    redirect_to polls_path
  end
  
  def update
    @poll = Poll.find(params[:id])
    @poll.update_attributes(params[:poll])
    redirect_to @poll
  end
  
  def taker
    # @poll = Poll.find(params[:id])
    @poll = Poll.find_by_public_url(params[:public_url])
    #grab all poll questions
    # @questions = Question.find_all_by_poll_id(@poll.id)
    @questions = @poll.questions
    @response = Response.new
    # @responses = Response.find_all_by_question_id(@question.id)
  end
  
  def public
    @poll = Poll.find_by_public_url(params[:public_url])
    redirect_to "http://localhost:3000/taker/#{@poll.public_url}"
  end
  
  def admin
    @poll = Poll.find_by_admin_url(params[:admin_url])
    # redirect_to "http://localhost:3000/polls/#{@poll.admin_url}"
  end

  
  
  private
  
  def short_url
    (('a'..'z').to_a + ('A'..'Z').to_a + (1..9).to_a).shuffle[0..5].join
  end
  
end
