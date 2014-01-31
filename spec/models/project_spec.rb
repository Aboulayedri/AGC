# == Schema Information
#
# Table name: projects
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  domain_id           :integer
#  chef_id             :integer
#  maitrise_ouvrage_id :integer
#  description         :text
#  created_at          :datetime
#  updated_at          :datetime
#  code                :string(255)
#

require 'spec_helper'

describe Project do
  pending "add some examples to (or delete) #{__FILE__}"
end
