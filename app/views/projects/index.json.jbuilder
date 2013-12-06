json.array!(@projects) do |project|
  json.extract! project, :id, :name, :domain_id, :chef_id, :maitrise_ouvrage_id, :description
  json.url project_url(project, format: :json)
end
