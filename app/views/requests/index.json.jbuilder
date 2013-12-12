json.array!(@requests) do |request|
  json.extract! request, :id, :project_id, :consultant_id, :date, :etat
  json.url request_url(request, format: :json)
end
