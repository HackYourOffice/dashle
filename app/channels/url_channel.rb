class UrlChannel < ApplicationCable::Channel
  
  TOPICS = {
      '#cat' => 'http://placekitten.com/g/400/400',
      '' => 'http://example.com'
  }
  
  def subscribed
    stream_from "urls_#{params['topic']}"
    transmit({:url => determine_initial_url(params['topic'])})
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private
  def determine_initial_url(topic)
    TOPICS[topic] || TOPICS['']
  end
end
