class PollsController < ApplicationController
  before_action :set_poll, only: %i[show edit update destroy]

  def index
    @polls = Poll.where(is_valid: true)
  end

  def show
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)
    @poll.is_valid = false
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

  private

  def poll_params
    params.require(:poll).permit(:title)
  end

  def set_poll
    @poll = Poll.find(params[:id])
  end
end
