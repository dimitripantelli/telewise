class ProgressesController < ApplicationController
  def create
    @progress = Progress.new(progress_params)
    @progress.user = current_user
    @progress.save
  end

  private

  def progress_params
    params.require(:progress).permit(:episode_id)
  end
end
