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
  belongs_to :entity
  has_many   :proposals

  accepts_nested_attributes_for :proposals, :allow_destroy => true

  validates :date, presence: true
end
