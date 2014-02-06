require 'spec_helper'

describe "project_codes/index" do
  before(:each) do
    assign(:project_codes, [
      stub_model(ProjectCode,
        :name => "Name"
      ),
      stub_model(ProjectCode,
        :name => "Name"
      )
    ])
  end

  it "renders a list of project_codes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
