json.cache! ['v1', event] do
  json.type 'Feature'
  json.geometry event.location
  json.properties do
    json.url event_url(event, :json)
    json.(event, :title, :description)
    json.event_at event.event_at.strftime('%F %H:%M%p')
    json.group do
      json.partial! event.group
    end
  end
end
