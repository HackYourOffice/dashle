class DashboardsController < ApplicationController
  def show
  end

  def load
    logger.info(params)
    ActionCable.server.broadcast("urls_#{params[:topic]}", url: params[:url])
  end
end
