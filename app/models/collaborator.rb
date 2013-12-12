# == Schema Information
#
# Table name: collaborators
#
#  id          :integer          not null, primary key
#  prenom      :string(255)
#  nom         :string(255)
#  id_karma    :string(255)
#  role        :string(255)
#  email       :string(255)
#  etat        :string(255)
#  statut      :string(255)
#  niv_diplome :string(255)
#  nat_diplome :string(255)
#  entity_id   :integer
#  manager_id  :integer
#  commentaire :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Collaborator < ActiveRecord::Base
  validates :prenom,    presence: { message: "Ne peut être vide" }
  validates :nom,       presence: { message: "Ne peut être vide" }
  #validates :id_karma,  uniqueness: { message: "Déjà utilisé : un des collaborateurs enregistrés a ce numéro karma" }
  validates :role,      inclusion: { in: %w(consultant manager resp_domaine), message: "%{value} n'est pas un rôle valide" }
  validates :entity_id, presence: { message: "Ne peut être vide" }

  scope :managers,     -> { where role: "manager" }
  scope :consultants,  -> { where role: "consultant" }
  scope :responsables, -> { where role: "resp_domaine" }
  scope :valides,      -> { where etat: "validé" }
  default_scope { order :nom }

  belongs_to :entity
  belongs_to :manager,     class_name: "Collaborator"
  has_many   :consultants, class_name: "Collaborator", foreign_key: "manager_id"

  def name
    "#{nom} #{prenom}"
  end
end
