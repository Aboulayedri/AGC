require 'spec_helper'

describe "project_codes/show" do
  before(:each) do
    @project_code = assign(:project_code, stub_model(ProjectCode,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
