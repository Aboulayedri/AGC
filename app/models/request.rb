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
#  proposal_id   :integer
#

class Request < ActiveRecord::Base
  validates :project_id,       presence: { message: "Ne peut être vide" }
  #validates :consultant_id,    presence: { message: "Ne peut être vide" }
  validates :proposal_id,      presence: { message: "Ne peut être vide" }
  #validates :date,             presence: { message: "Ne peut être vide" }

  scope :encours,     -> { where etat: "encours" }
  scope :refusees,    -> { where etat: "refusée" }
  scope :acceptees,   -> { where etat: "acceptée" }
  scope :confirmees,  -> { where etat: "confirmée" }
  scope :a_traiter,   -> { where date: Time.now.next_week.all_week }

  belongs_to :project
  belongs_to :proposal
  #belongs_to :consultant, class_name: "Collaborator"

  after_save :set_date, if: :empty_date?

  def accepter
    self.etat = "acceptée"
    self.save
  end

  def refuser
    self.etat = "refusée"
    self.save
  end

  def confirmer
    self.etat = "confirmée"
    self.save
  end

  protected
  def set_date
    self.date = self.proposal.date
    self.save
  end

  def empty_date?
    self.date.nil?
  end
end
