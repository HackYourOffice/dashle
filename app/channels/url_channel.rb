class UrlChannel < ApplicationCable::Channel
  
  TOPICS = {
      '#cat' => 'http://placekitten.com/g/400/400',
      '' => 'http://example.com'
  }
  
  def subscribed
    stream_from "urls_#{params['topic']}"
    transmit({:url => self.class.determine_url(params['topic'])})
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def self.set_url_for_topic(topic, url)
    TOPICS[topic] = url
    inform_clients(topic)
  end

  private
  def self.determine_url(topic)
    TOPICS[topic] || TOPICS['']
  end

  def self.inform_clients(topic)
    ActionCable.server.broadcast("urls_#{topic}", url: determine_url(topic))
  end
end
