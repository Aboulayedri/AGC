# == Schema Information
#
# Table name: requests
#
#  id            :integer          not null, primary key
#  project_id    :integer
#  consultant_id :integer
#  date          :date
#  etat          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Request < ActiveRecord::Base
  validates :project_id,       presence: { message: "Ne peut être vide" }
  validates :consultant_id,    presence: { message: "Ne peut être vide" }
  validates :date,             presence: { message: "Ne peut être vide" }

  belongs_to :project
  belongs_to :consultant, class_name: "Collaborator"
end
