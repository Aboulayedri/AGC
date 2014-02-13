# == Schema Information
#
# Table name: collaborators
#
#  id                     :integer          not null, primary key
#  prenom                 :string(255)
#  nom                    :string(255)
#  id_karma               :string(255)
#  role                   :string(255)
#  email                  :string(255)
#  etat                   :string(255)
#  statut                 :string(255)
#  niv_diplome            :string(255)
#  nat_diplome            :string(255)
#  entity_id              :integer
#  manager_id             :integer
#  commentaire            :text
#  created_at             :datetime
#  updated_at             :datetime
#  profil                 :string(255)
#  eligibilite            :string(255)
#  aramis_entity_id       :integer
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

class Collaborator < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :prenom,           presence: { message: "Ne peut être vide" }
  validates :nom,              presence: { message: "Ne peut être vide" }
  validates :etat,             presence: { message: "Ne peut être vide" }, inclusion: { in: %w(actif inactif), message: "%{value} n'est pas un état valide" }
  validates :email,            presence: { message: "Ne peut être vide" }
  validates :id_karma,         uniqueness: { message: "Déjà utilisé : un des collaborateurs enregistrés a ce numéro karma" }, allow_blank: true
  validates :role,             presence: { message: "Ne peut être vide" }, inclusion: { in: %w(admin consultant manager manager_dri resp_domaine staffeur), message: "%{value} n'est pas un rôle valide" }
  validates :entity_id,        presence: { message: "Ne peut être vide" }
  validates :aramis_entity_id, presence: { message: "Ne peut être vide" }
  validates :niv_diplome,      presence: { message: "Ne peut être vide si éligibilité saisie" }, unless: :eligibilite_absent?
  validates :nat_diplome,      presence: { message: "Ne peut être vide si éligibilité saisie" }, unless: :eligibilite_absent?

  scope :managers,     -> { where role: "manager" }
  scope :consultants,  -> { where role: "consultant" }
  scope :responsables, -> { where role: "resp_domaine" }
  scope :actifs,       -> { where etat: "actif" }
  default_scope           { order :nom }

  belongs_to :entity
  belongs_to :aramis_entity
  belongs_to :manager,     class_name: "Collaborator"
  has_many   :consultants, class_name: "Collaborator", foreign_key: "manager_id"
  has_many   :proposals,   class_name: "Collaborator", foreign_key: "consultant_id"
  has_one    :domain,      class_name: "Collaborator", foreign_key: "responsable_id"

  def name
    "#{nom} #{prenom}"
  end

  def profil_valide?
   !eligibilite.to_s.empty?
  end

  def eligibilite_absent?
    eligibilite.to_s.empty?
  end
end
