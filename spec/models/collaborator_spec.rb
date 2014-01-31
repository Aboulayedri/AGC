# == Schema Information
#
# Table name: collaborators
#
#  id               :integer          not null, primary key
#  prenom           :string(255)
#  nom              :string(255)
#  id_karma         :string(255)
#  role             :string(255)
#  email            :string(255)
#  etat             :string(255)
#  statut           :string(255)
#  niv_diplome      :string(255)
#  nat_diplome      :string(255)
#  entity_id        :integer
#  manager_id       :integer
#  commentaire      :text
#  created_at       :datetime
#  updated_at       :datetime
#  profil           :string(255)
#  eligibilite      :string(255)
#  aramis_entity_id :integer
#

require 'spec_helper'

describe Collaborator do
  pending "add some examples to (or delete) #{__FILE__}"
end
