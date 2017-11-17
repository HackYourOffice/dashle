class AdminController < ApplicationController
  def show
  end

  def modify
    if parameter_isset('new_topic_name')
      # topics.add(params['new_topic_name'])
      logger.info("New topic: " + params['new_topic_name'])
    elsif parameter_isset('selection')
      # show urls section
      logger.info("Open details for: " + params['selection'])
      @selected_topic = params['selection']
    end
  end

  def parameter_isset(param)
    defined? param and params[param] != ''
  end
end