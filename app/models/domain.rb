# == Schema Information
#
# Table name: domains
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :text
#  created_at     :datetime
#  updated_at     :datetime
#  responsable_id :integer
#

class Domain < ActiveRecord::Base
  validates :name, presence: { message: "Ne peut être vide" }, uniqueness: { message: "Déjà utilisé" }

  belongs_to :responsable, class_name: "Collaborator"
  has_many   :projects
  has_many   :requests, through: :project
end
