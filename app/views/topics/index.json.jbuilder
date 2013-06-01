json.array!(@topics) do |topic|
  json.extract! topic, :title, :description
  json.url topic_url(topic, format: :json)
end