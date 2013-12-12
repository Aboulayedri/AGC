require 'spec_helper'

describe "requests/show" do
  before(:each) do
    @request = assign(:request, stub_model(Request,
      :project_id => 1,
      :consultant_id => 2,
      :etat => "Etat"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Etat/)
  end
end
