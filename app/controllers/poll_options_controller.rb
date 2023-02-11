class PollOptionsController < ApplicationController
  def create
    @poll_option = PollOption.new(poll_option_params)
    @poll = Poll.find(params[:poll_id])
    @poll_option.poll = @poll
    if @poll_option.save
      redirect_to poll_path(@poll)
    else
      render poll_path(@poll), status: :unprocessable_entity
    end
  end

  def destroy
    @poll_option = PollOption.find(params[:id])
    poll = @poll_option.poll
    @poll_option.destroy
    redirect_to poll_path(poll), status: :see_other
  end

  private

  def poll_option_params
    params.require(:poll_option).permit(:description)
  end
end
