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

require 'spec_helper'

describe Collaborator do
  pending "add some examples to (or delete) #{__FILE__}"
end
