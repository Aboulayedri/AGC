json.array!(@project_codes) do |project_code|
  json.extract! project_code, :id, :name
  json.url project_code_url(project_code, format: :json)
end
