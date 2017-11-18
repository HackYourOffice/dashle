class DashboardsController < ApplicationController
  layout 'bare'

  def show
  end

  def load
    logger.info(params)
    
    UrlChannel.set_url_for_topic(params[:topic], params[:url])
  end
end
