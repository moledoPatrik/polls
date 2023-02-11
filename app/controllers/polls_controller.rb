class PollsController < ApplicationController
  before_action :set_poll, only: %i[show edit update destroy]

  def index
    @polls = Poll.all
  end

  def show
    @poll_option = PollOption.new
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)
    @poll.started = false
    @poll.user = current_user
    if @poll.save
      redirect_to poll_path(@poll)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @poll.update(poll_params)
      redirect_to poll_path(@poll)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @poll.destroy
    redirect_to polls_path, status: :see_other
  end

  def start_poll
    @poll = Poll.find(params[:id])
    @poll.start!
    @poll.save
    redirect_to poll_path(@poll)
  end

  private

  def poll_params
    params.require(:poll).permit(:title)
  end

  def set_poll
    @poll = Poll.find(params[:id])
  end
end
