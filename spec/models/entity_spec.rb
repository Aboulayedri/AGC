# == Schema Information
#
# Table name: entities
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  manager_id  :integer
#

require 'spec_helper'

describe Entity do
  pending "add some examples to (or delete) #{__FILE__}"
end
