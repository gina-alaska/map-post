json.cache! ['v1', event] do
  json.type 'Feature'
  json.geometry event.location
  json.properties do
    json.id event.id
    json.url event_url(event, :geojson)
    json.(event, :title, :description)
    json.event_at event.event_at
    json.group do
      json.partial! event.group
    end
  end
end
