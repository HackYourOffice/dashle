class AdminController < ApplicationController
  def show
  end

  def modify
    @selected_topic = ''
    @message = ''
    if isset('add_topic')
      @message = 'Add topic: ' + params['new_topic_name']
    elsif isset('edit_topic')
      logger.info("Open details for: " + params['selection'])
      @selected_topic = params['selection']
    elsif isset('del_topic')
      @message = 'Warum löscht du das topic man'
    end
  end

  def isset(param)
    !params[param].nil?
  end
end