require 'spec_helper'

describe "requests/new" do
  before(:each) do
    assign(:request, stub_model(Request,
      :project_id => 1,
      :consultant_id => 1,
      :etat => "MyString"
    ).as_new_record)
  end

  it "renders new request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", requests_path, "post" do
      assert_select "input#request_project_id[name=?]", "request[project_id]"
      assert_select "input#request_consultant_id[name=?]", "request[consultant_id]"
      assert_select "input#request_etat[name=?]", "request[etat]"
    end
  end
end
