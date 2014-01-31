require 'spec_helper'

describe "aramis_entities/show" do
  before(:each) do
    @aramis_entity = assign(:aramis_entity, stub_model(AramisEntity,
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
  end
end
