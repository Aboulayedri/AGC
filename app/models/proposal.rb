# == Schema Information
#
# Table name: proposals
#
#  id            :integer          not null, primary key
#  consultant_id :integer
#  date          :date
#  nbre_jour     :integer
#  etat          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  list_id       :integer
#

class Proposal < ActiveRecord::Base
  validates :consultant_id,    presence: { message: "Ne peut être vide" }
  validates :date,             presence: { message: "Ne peut être vide" }

  belongs_to :consultant, class_name: "Collaborator"
  belongs_to :list
end
