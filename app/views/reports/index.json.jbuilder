json.array!(@reports) do |report|
  json.extract! report, :id, :event_id, :user_id, :reason
  json.url report_url(report, format: :json)
end
