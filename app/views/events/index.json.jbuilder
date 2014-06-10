json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :group_id, :user_id, :visible, :event_at
  json.url event_url(event, format: :json)
end
