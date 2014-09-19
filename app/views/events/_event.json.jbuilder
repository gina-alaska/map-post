json.extract! event, :id, :title, :description, :location, :starts_at, :ends_at, :created_at, :updated_at
json.url event_url event
json.group_id event.group_id
json.group_url group_url event.group, :json
