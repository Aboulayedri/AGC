json.array!(@proposals) do |proposal|
  json.extract! proposal, :id, :consultant_id, :date, :nbre_jour, :etat
  json.url proposal_url(proposal, format: :json)
end
