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

require 'spec_helper'

describe Request do
  pending "add some examples to (or delete) #{__FILE__}"
end
