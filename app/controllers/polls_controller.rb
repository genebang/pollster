class PollsController < ApplicationController

  # before_filter :authenticate_user!

  def index
    @polls = Poll.all
  end

  def show
    if take_poll?
      @poll = Poll.find_by_public_url(params[:public_url])
      @questions = @poll.questions
      render :template => 'polls/taker'
    else
      @poll = Poll.find_by_admin_url(params[:id])
      @questions = @poll.questions
    end
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(params[:poll])
    if @poll.save
      redirect_to poll_path(@poll.admin_url), :notice => "poll successfully added"
    else
      render :new
    end

  end

  def edit
    @poll = Poll.find(params[:id])
  end

  def update
    @poll = Poll.find(params[:id])
    @poll.update_attributes(params[:poll])
    redirect_to admin_poll_path(@poll.admin_url)
  end

  def destroy
    @poll = Poll.find(params[:id])
    @poll.destroy

    redirect_to polls_path
  end

  def take_poll?
    params[:public_url].present?
  end
end
