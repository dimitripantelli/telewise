class ProgressesController < ApplicationController
  def create
    if params.key?(:progress)
      @progress = Progress.new(progress_params)
      @progress.user = current_user
      @progress.save
    else
      Progress.where(user: current_user).each do |prog|
        if prog.episode.show.id == params[:show].to_i && prog.episode.season_number == params[:season].to_i
          prog.destroy!
        end
      end
    end
  end

  private

  def progress_params
    params.require(:progress).permit(:episode_id)
  end
end
