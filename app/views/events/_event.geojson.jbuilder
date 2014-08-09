json.cache! ['v2', event, event.group] do
  json.type 'Feature'
  json.geometry event.location
  json.properties do
    json.extract! event, :id, :title, :description, :starts_at, :ends_at, :created_at, :updated_at
    json.url event_url(event)
    json.group_id event.group_id
    json.group_url group_url event.group
    json.group do
      json.partial! event.group
    end
  end
end
