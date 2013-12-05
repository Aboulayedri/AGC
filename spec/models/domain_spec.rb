# == Schema Information
#
# Table name: domains
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :text
#  created_at     :datetime
#  updated_at     :datetime
#  responsable_id :integer
#

require 'spec_helper'

describe Domain do
  pending "add some examples to (or delete) #{__FILE__}"
end
