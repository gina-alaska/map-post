json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :location, :event_at, :created_at, :updated_at
  json.group_id event.group_id
  json.group_url group_url event.group, :json
  json.url event_url(event, format: :json)
end
