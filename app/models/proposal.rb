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
#  project_id    :integer
#  entity_id     :integer
#

class Proposal < ActiveRecord::Base
  before_validation :initialiser_date_si_null#, :initialiser_nombre_jours_si_null
  validates :consultant_id, presence: { message: "Ne peut être vide" }
  validates :entity_id,     presence: { message: "Ne peut être vide" }
  validates :etat,          presence: { message: "Ne peut être vide" }
  validates :date,          presence: { message: "Ne peut être vide" }
  validates :date,          inclusion: {in: Time.now.next_week.all_week, message: "Il n'est pas permis de faire des propositions pour une autre période que la semaine prochaine"}, on: :create
  validates :nbre_jour,     inclusion: {in: 1..5, message: "Le nombre de jours doit être compris entre 1 et 5"}
  validate  :unicite_proposition, on: :create

  scope :disponibles, -> { where etat: "disponible" }
  scope :reservees,   -> { where etat: "reservée" }
  scope :validees,    -> { where etat: "validée" }
  scope :arrivees,    -> { where etat: "arrivée" }
  scope :a_traiter,   -> { where date: Time.now.next_week.all_week }

  belongs_to :consultant, class_name: "Collaborator"
  belongs_to :list
  belongs_to :project
  belongs_to :entity
  #has_many   :requests
  
  #after_save   :set_date,   if: :empty_date?
  #after_create :reconduire, if: :present?

  def name
    consultant.name
  end

  def publier
    self.etat = "disponible"
    self.save
  end

  def arriver
    self.etat = "arrivée"
    self.save
  end

  def liberer
    self.etat = "disponible"
    self.project_id = ""
    self.save
  end

  def valider
    self.etat = "validée"
    self.save
  end

  #protected
  def set_date
    self.date = self.list.date
    self.save
  end

  def empty_date?
    self.date.nil?
  end

  def reconduire
    self.project_id = Proposal.where(consultant_id: consultant_id, etat: "arrivée", date: Time.now.all_week).first.project_id
    self.etat       = "reservée"
    self.save
  end

  def present?
    !Proposal.where(consultant_id: consultant_id, etat: "arrivée", date: Time.now.all_week).empty?
  end

  protected
  def unicite_proposition
    errors.add(:date, "Il ne peut y avoir q'une proposition par consultant pour chaque semaine") unless Proposal.where(consultant_id: consultant_id, date: date.to_time.all_week).empty?
  end

  def initialiser_date_si_null
    self.date = Time.now.next_week.strftime("%d-%m-%Y") if date.nil?
  end

  def initialiser_nombre_jours_si_null
    self.nbre_jour = 5 if nbre_jour.nil?
  end
end
