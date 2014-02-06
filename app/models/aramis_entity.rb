# == Schema Information
#
# Table name: aramis_entities
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  description     :text
#  created_at      :datetime
#  updated_at      :datetime
#  project_code_id :integer
#

class AramisEntity < ActiveRecord::Base
  validates :name, presence: { message: "Ne peut être vide" }, uniqueness: { message: "Existe déjà : merci de choisir un autre nom" }
  validates :project_code_id, presence: { message: "Ne peut être vide" }

  belongs_to :project_code
  has_many :collaborators
end
