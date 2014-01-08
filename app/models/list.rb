# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  entity_id  :integer
#  date       :date
#  created_at :datetime
#  updated_at :datetime
#

class List < ActiveRecord::Base
  default_scope { order "date DESC" }
  belongs_to :entity
  has_many   :proposals, dependent: :destroy

  accepts_nested_attributes_for :proposals, :allow_destroy => true

  validates :date, presence: { message: "Ne peut être vide" }

  validate :unicite_liste, on: :create
 
  def unicite_liste
    errors.add(:date, "Il ne peut y avoir q'une liste de propositions par entité pour chaque semaine") unless entity.lists.where(date: date.to_time.all_week).empty?
  end
end
