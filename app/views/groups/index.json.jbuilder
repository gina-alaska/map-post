json.array!(@groups) do |group|
  json.extract! group, :id, :name, :description, :restricted, :visible
  json.url group_url(group, format: :json)
end
