require 'spec_helper'

describe "project_codes/edit" do
  before(:each) do
    @project_code = assign(:project_code, stub_model(ProjectCode,
      :name => "MyString"
    ))
  end

  it "renders the edit project_code form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_code_path(@project_code), "post" do
      assert_select "input#project_code_name[name=?]", "project_code[name]"
    end
  end
end
