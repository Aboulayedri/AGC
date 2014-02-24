# == Schema Information
#
# Table name: projects
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  domain_id           :integer
#  chef_id             :integer
#  maitrise_ouvrage_id :integer
#  description         :text
#  created_at          :datetime
#  updated_at          :datetime
#  code                :string(255)
#  etat                :string(255)
#

class Project < ActiveRecord::Base
  validates :name,                presence: { message: "Ne peut être vide" }, uniqueness: { message: "Existe déjà : merci de choisir un autre nom pour votre projet" }
  validates :domain_id,           presence: { message: "Ne peut être vide" }
  validates :chef_id,             presence: { message: "Ne peut être vide" }
  # validates :maitrise_ouvrage_id, presence: { message: "Ne peut être vide" }
  validates :code,                presence: { message: "Ne peut être vide" }
  validates :etat,                presence: { message: "Ne peut être vide" }

  scope :actives, -> { where etat: "activé" }
  default_scope { order :name }

  belongs_to :domain
  belongs_to :chef,   class_name: "Collaborator"
  belongs_to :maitrise_ouvrage, class_name: "Collaborator"
  has_many   :proposals
end
