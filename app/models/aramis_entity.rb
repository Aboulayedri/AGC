# == Schema Information
#
# Table name: aramis_entities
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class AramisEntity < ActiveRecord::Base
  validates :name, presence: { message: "Ne peut être vide" }, uniqueness: { message: "Existe déjà : merci de choisir un autre nom" }

  has_many :collaborators
end
