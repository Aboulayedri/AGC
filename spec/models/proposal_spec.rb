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

require 'spec_helper'

describe Proposal do
  pending "add some examples to (or delete) #{__FILE__}"
end
