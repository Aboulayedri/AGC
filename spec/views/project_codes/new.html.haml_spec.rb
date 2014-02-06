require 'spec_helper'

describe "project_codes/new" do
  before(:each) do
    assign(:project_code, stub_model(ProjectCode,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new project_code form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_codes_path, "post" do
      assert_select "input#project_code_name[name=?]", "project_code[name]"
    end
  end
end
