class DashboardsController < ApplicationController
  def show
  end

  def load
    logger.info(params)
    ActionCable.server.broadcast('urls', url: params[:url])
  end
end
