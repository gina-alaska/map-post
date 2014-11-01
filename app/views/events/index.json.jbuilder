json.array!(@events) do |event|
  next if event.reports.count > 3
  json.partial! event
  json.url event_url(event, format: :json)
end
