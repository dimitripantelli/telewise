class EpisodesController < ApplicationController
  skip_before_action :authenticate_user! # Add only/except to include/exclude future controller actions
end
