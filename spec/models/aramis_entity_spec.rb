# == Schema Information
#
# Table name: aramis_entities
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  description     :text
#  created_at      :datetime
#  updated_at      :datetime
#  project_code_id :integer
#

require 'spec_helper'

describe AramisEntity do
  pending "add some examples to (or delete) #{__FILE__}"
end
