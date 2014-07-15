json.array!(@groups) do |group|
  json.partial! group
end
