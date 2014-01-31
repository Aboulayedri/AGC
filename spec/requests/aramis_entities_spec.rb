require 'spec_helper'

describe "AramisEntities" do
  describe "GET /aramis_entities" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get aramis_entities_path
      response.status.should be(200)
    end
  end
end
