# == Schema Information
#
# Table name: entities
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  manager_id  :integer
#

class Entity < ActiveRecord::Base
  validates :name, presence: { message: "Ne peut être vide" }, uniqueness: { message: "Déjà utilisé" }
  
  belongs_to :manager, class_name: "Collaborator"
  has_many   :collaborators
  has_many   :lists
  has_many   :proposals
end
