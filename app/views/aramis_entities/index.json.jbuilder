json.array!(@aramis_entities) do |aramis_entity|
  json.extract! aramis_entity, :id, :name, :description
  json.url aramis_entity_url(aramis_entity, format: :json)
end
