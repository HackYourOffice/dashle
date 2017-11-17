class DashboardsController < ApplicationController
  def show
  end

  def load
    logger.info(params)
    
    UrlChannel.set_url_for_topic(params[:topic], params[:url])
    # ActionCable.server.broadcast("urls_#{params[:topic]}", url: params[:url])
  end
end
