json.type "FeatureCollection"
json.features @events do |event|
  next if event.reports.count > 3
  json.partial! event
end