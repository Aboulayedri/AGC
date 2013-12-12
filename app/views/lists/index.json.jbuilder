json.array!(@lists) do |list|
  json.extract! list, :id, :entity_id, :date
  json.url list_url(list, format: :json)
end
