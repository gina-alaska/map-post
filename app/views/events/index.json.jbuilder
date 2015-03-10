json.array!(@events) do |event|
  json.partial! event
  json.url event_url(event, format: :json)
end
