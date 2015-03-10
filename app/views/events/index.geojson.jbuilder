json.type 'FeatureCollection'
json.features @events do |event|
  json.partial! event
end
