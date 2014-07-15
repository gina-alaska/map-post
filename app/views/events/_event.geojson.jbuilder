json.cache! ['v1', event, event.group] do
  json.type 'Feature'
  json.geometry event.location
  json.properties do
    json.extract! event, :id, :title, :description, :starts_at, :ends_at, :created_at, :updated_at
    json.group_id event.group_id
    json.group_url group_url event.group, :json
    json.group do
      json.partial! event.group
    end
  end
end
