require 'spec_helper'

describe "requests/edit" do
  before(:each) do
    @request = assign(:request, stub_model(Request,
      :project_id => 1,
      :consultant_id => 1,
      :etat => "MyString"
    ))
  end

  it "renders the edit request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", request_path(@request), "post" do
      assert_select "input#request_project_id[name=?]", "request[project_id]"
      assert_select "input#request_consultant_id[name=?]", "request[consultant_id]"
      assert_select "input#request_etat[name=?]", "request[etat]"
    end
  end
end
