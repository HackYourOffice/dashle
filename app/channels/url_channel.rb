class UrlChannel < ApplicationCable::Channel
  def subscribed
    stream_from "urls"
    transmit({:url => determine_initial_url})
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private
  def determine_initial_url
    'http://placekitten.com/g/400/400'
  end
end
