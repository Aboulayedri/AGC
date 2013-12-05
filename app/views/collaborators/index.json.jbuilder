json.array!(@collaborators) do |collaborator|
  json.extract! collaborator, :id, :prenom, :nom, :id_karma, :role, :email, :etat, :statut, :niv_diplome, :nat_diplome, :entity_id, :manager_id, :commentaire
  json.url collaborator_url(collaborator, format: :json)
end
