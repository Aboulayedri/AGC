# == Schema Information
#
# Table name: project_codes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ProjectCode < ActiveRecord::Base
  validates :name, presence: {message: "Ne peut être vide"}, uniqueness: { message: "Existe déjà : merci de choisir un autre nom" }

  default_scope { order :name }

  has_many :aramis_entities
end
