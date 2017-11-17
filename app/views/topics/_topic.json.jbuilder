json.extract! topic, :id, :name, :urls, :created_at, :updated_at
json.url topic_url(topic, format: :json)
