class UrlChannel < ApplicationCable::Channel
  DEFAULT_URL = 'http://example.com'
  
  def subscribed
    stream_from "urls_#{params['topic']}"
    transmit({:url => self.class.determine_url(params['topic'])})
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def self.set_url_for_topic(topic, *urls)
    topic_model = Topic.find_by_name(topic) || Topic.new(name: topic)
    topic_model.urls = urls
    topic_model.save
    inform_clients(topic)
  end

  private
  def self.determine_url(topic)
    url = if topic = Topic.find_by_name(topic)
            topic.urls.sample
          end
    url || DEFAULT_URL
  end

  def self.inform_clients(topic)
    ActionCable.server.broadcast("urls_#{topic}", url: determine_url(topic))
  end
end
