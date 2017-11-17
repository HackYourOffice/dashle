class UrlChannel < ApplicationCable::Channel
  def subscribed
    stream_from "urls"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
