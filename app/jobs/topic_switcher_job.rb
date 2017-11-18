class TopicSwitcherJob < ApplicationJob
  queue_as :default

  def perform(*args)
    thread_status = args[0]
    UrlChannel.get_topic_status_from_db(thread_status[:topic_name], thread_status[:index] + 1)
  end
end
