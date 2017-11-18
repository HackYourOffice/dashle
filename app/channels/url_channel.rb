class UrlChannel < ApplicationCable::Channel
  DEFAULT_URL = 'http://example.com'
  
  TOPICS = {}

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

  def self.get_topic_status_from_db(topic_name, index = 0)

    url = if (topic = Topic.find_by_name(topic_name))
            if topic.urls.size < index
              index = 0
            end
            topic.urls[index]
          end

    thread_status = {
        :topic_name => topic_name,
        :url => url || DEFAULT_URL,
        :index => index,
        :timer => 5
    }
    start_timer(thread_status)
    TOPICS[topic_name] = thread_status
  end

  def self.inform_clients(topic)
    ActionCable.server.broadcast("urls_#{topic}", url: determine_url(topic))
  end

  private
  def self.determine_url(topic_name)
    topic_status = TOPICS[topic_name] || get_topic_status_from_db(topic_name)
    topic_status[:url]
  end

  def self.start_timer(thread_status)
    time = thread_status[:timer]
    TopicSwitcherJob.set(wait: time.second).perform_later(thread_status)
  end

end
